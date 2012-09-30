# coding: utf-8

module WenlinDbScanner

# Parses the databases that describe the parts of speech.
module SpeechParts
  # The English parts of speech used in the en->zh dictionary.
  #
  # @param [String] db_root the directory containing the .db files
  # @return [Enumerator<SpeechPart>]
  def self.en(db_root)
    parts File.join(db_root, 'ab_ec.db')
  end

  # The Chinese parts of speech used in the zh->en dictionary.
  #
  # @param [String] db_root the directory containing the .db files
  # @return [Enumerator<SpeechPart>]
  def self.zh(db_root)
    parts File.join(db_root, 'ab_ce.db')
  end

  # Generic decoder for a database of parts of speech.
  #
  # @param [String] db_file path to the .db file containing part-of-speech data
  # @return [Enumerator<SpeechPart>]
  def self.parts(db_file)
    Enumerator.new do |yielder|
      db = Db.new db_file
      db.records.each do |record|
        next if record.binary?
        lines = record.text.split("\n").map(&:strip).reject(&:empty?)

        part = SpeechPart.new
        part.abbrev, part.en, part.pinyin, part.zh =
            *lines[0].split('=').map(&:strip)
        part.description = lines[1]
        yielder << part
      end
      db.close
    end
  end
end  # module WenlinDbScanner::SpeechParts

# Wraps a record in the parts-of-speech database.
class SpeechPart < Struct.new(:abbrev, :en, :zh, :pinyin, :description)
  # @!attribute [r] abbrev
  #   @return [String] e.g., 'v.'; used by entries in the other databases

  # @!attribute [r] en
  #   @return [String] English name, e.g. 'Verb'

  # @!attribute [r] zh
  #   @return [String] Chinese name, in Hanzi, e.g. '动词'

  # @!attribute [r] pinyin
  #   @return [String] Chinese name, in pinyin, e.g. 'Dòngcí'

  # @!attribute [r] description
  #   @return [String] English-language explanation of what the part of speech is

  # @return [Hash]
  def to_hash
    Hash[each_pair.to_a]
  end
end  # class WenlinDbScanner::SpeechPart

end  # namespace WenlinDbScanner
