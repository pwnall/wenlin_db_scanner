# coding: utf-8

module WenlinDbScanner

# Parses the data in the dictionary databases.
module Dicts
  # The entries in the English->Chinese dictionary.
  #
  # @param [String] db_root the directory containing the .db files
  # @return [Enumerator<DictEntry>]
  def self.en_zh(db_root)
    entries File.join(db_root, 'yinghan.db')
  end

  # The entries in the Chinese->English dictionary.
  #
  # @param [String] db_root the directory containing the .db files
  # @return [Enumerator<DictEntry>]
  def self.zh_en(db_root)
    entries File.join(db_root, 'cidian.db')
  end

  # Generic decodeder for a database of dictionary entries.
  #
  # @param [String] db_file path to the .db file containing dictionary data
  # @return [Enumerator<DictEntry>]
  def self.entries(db_file)
    Enumerator.new do |yielder|
      db = Db.new db_file
      db.records.each do |record|
        next if record.binary?
        lines = record.text.split("\n").map(&:strip).reject(&:empty?)

        key = lines[0]

        entry = DictEntry.new
        entry.key = key
        entry.term = key_term key
        entry.latin_term = key_latin_term key
        entry.term_frequency = key_frequency key
        entry.latin_frequency_boost = key_latin_frequency key

        collect_values = false
        lines[1..-1].each do |line|
          tag, data = *line.split(' ', 2)
          tag_parts = /^(\d*)(\w+)(\@.*)?$/.match tag
          unless tag_parts
            raise "Unknown tag format #{tag} in dictionary entry!\n#{record.text}"
          end
          case tag_parts[2]
          when 'ipa'
            prop = :ipa
          when 'a'
            prop = :abbreviates
          when 'c'
            prop = nil
            prop1 = :zh
            data1 = data.gsub(/\[[^\]]*\]/, '').strip
            prop2 = :zh_tw
            data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            if data2.empty?
              data2 = data1
            else
              if data2.index '-'
                # Handle entries like
                data2 = data2.chars.map.with_index { |char, index|
                  (char == '-') ? data1[index] : char
                }.join ''
              end
            end
          when 'd'
            prop = :defn
          when 'b'  # NOTE: base of?
            prop = nil
            prop1 = :used_in_terms
            prop2 = :used_in_serials
            data1 = data.gsub(/\[[^\]]*\]/, '').strip
            data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            collect_values = true
          when 'e'  # NOTE: equivalent?
            prop = nil
            prop1 = :linked_terms
            prop2 = :linked_serials
            data1 = data.gsub(/\[[^\]]*\]/, '').strip
            data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            collect_values = true
          when 'f' # e.g. 2.2 [XHPC:4]
            prop = :freq
            data = data.split('[', 2).first.strip
          when 'gr'
            prop = :grade
          when 'h'
            # NOTE: guessing this means it shows up in the application's help.
            #       it seems to only be set for technical terms
            prop = false
          when 'hz'
            prop = :example_zh
          when 'infl'
            prop = :inflection
          when 'j'  # NOTE: jump?
            prop = :see_serial
          when 'k'
            prop = :see_term
          when 'm'
            prop = :measure_word
            # NOTE: stripping the complex hanzi, as it can be found by
            #       cross-referencing the measure word's key
            data = data.gsub(/\[[^\]]*\]/, '').strip
            data = data.split('/').map(&:strip)
          when 'n'
            # NOTE: the field of reference sometimes looks like "mus.[音]"
            data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            if data2.empty?
              prop = :field
            else
              prop = nil
              prop1 = :field
              prop2 = :field_zh
              data1 = data.gsub(/\[[^\]]*\]/, '').strip
              data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            end
          when 'note'
            prop = :note
          when 'o'
            prop = :construction
          when 'p'
            prop = :speech_part
          when 'q'
            prop = :usage
          when 'r', 'rem'
            # NOTE: skipping remarks / revisions for now; they might be
            #       interesting for research
            prop = false
          when 's'
            prop = :serial
          when 'sub'
            prop = nil
            prop1 = :extend
            prop2 = :extend_serial
            data1 = data.gsub(/\[[^\]]*\]/, '').strip
            data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            collect_values = true
          when 'subof'
            prop = nil
            prop1 = :extended_from
            prop2 = :extended_from_serial
            data1 = data.gsub(/\[[^\]]*\]/, '').strip
            data2 = data.scan(/\[([^\]]*)\]/).map(&:first).join('; ').strip
            collect_values = true
          when 't'
            prop = :example_translation
          when 'u'
            prop = :unverified
            data = true
          when 'v'
            # NOTE: no idea what this is, only shows up once
            prop = false
          when 'w'
            prop = :reference
          when 'x'
            prop = :example
          when 'y'
            prop = :years
          else
            raise "Unknown tag #{tag} in dictionary entry!\n#{record.text}"
          end
          next if prop == false

          ops = if prop
            [[prop, data]]
          else
            [[prop1, data1], [prop2, data2]]
          end
          ops.each do |k, v|
            if tag_parts[1].empty?
              if collect_values
                entry[k] ||= []
                entry[k] << v
              else
                entry[k] = v
              end
            else
              # Exampe: 31x means example: [blah, blah, [value]]
              indexes = tag_parts[1].chars.map do |char|
                ((char == ?0) ? 10 : char.to_i) - 1
              end
              if indexes.any? { |i| i < 0 }
                puts "Broken tag #{tag} #{tag_parts[1]} #{indexes.inspect}\n#{record.text}"
              end
              entry[k] ||= []
              unless entry[k].kind_of?(Array)
                # Fix entries listing props x and 2x instead of 1x, 2x.
                entry[k] = [entry[k]]
              end
              array = entry[k]
              indexes[0...-1].each do |i|
                array[i] ||= []
                unless array[i].kind_of?(Array)
                  # Fix entries listing props 1x and 12x instead of 11x, 12x.
                  array[i] = [array[i]]
                end
                array = array[i]
              end
              if collect_values
                array[indexes.last] ||= []
                array[indexes.last] << v
              else
                array[indexes.last] = v
              end
            end
          end
        end

        yielder << entry
      end
    end
  end

  # The term defined by a dictionary key.
  #
  # @param [String] key a dictionary key
  # @return [String] the term inside the key
  def self.key_term(key)
    key.gsub(/[^\p{L}]/, '')
  end

  # The term defined by a dictionary key, spelled using Latin characters.
  #
  # @param [String] key a dictionary key
  # @return [String] the term inside the key, spelled using Latin characters
  def self.key_latin_term(key)
    Chars.pinyin_to_latin key_term(key)
  end

  # The frequency information expressed in a dictionary key.
  #
  # This shows the relative frequency of the term, among all the terms with
  # the same exact spelling. For Chinese terms, the spelling is pinyin.
  #
  # @param [String] key a dictionary key
  # @return [Integer, nil] nil if the key does not have frequency information
  def self.key_frequency(key)
    match = /^[^\p{L}]+/.match(key)
    return nil unless match
    match[0].tr('⁰¹²³⁴⁵⁶⁷⁸⁹' , '0123456789').to_i
  end

  # The latin frequency information expressed in a dictionary key.
  #
  # This is true if the term is the most frequent, among all terms with the
  # same latin spelling. For Chinese terms, the latin spelling is pinyin with
  # tone information removed.
  #
  # @param [String] key a dictionary key
  # @return [Boolean]
  def self.key_latin_frequency(key)
    key[-1] == ?*
  end
end  # module WenlinDbScanner::Dicts

# Wraps a record in a dictionary database
class DictEntry < Struct.new(:key, :term, :ipa, :zh, :zh_tw, :defn, :freq,
                             :grade, :example_zh, :measure_word, :speech_part,
                             :serial, :example, :example_translation,
                             :reference, :term_frequency,
                             :latin_frequency_boost, :field, :field_zh,
                             :unverified, :inflection, :extend, :extend_serial,
                             :extended_from, :extended_from_serial,
                             :abbreviates, :see_serial, :usage, :latin_term,
                             :linked_terms, :linked_serials, :note, :see_term,
                             :used_in_terms, :used_in_serials,
                             :construction, :years)
  # @!attribute [r] key
  #   @return [String] the term's sort key in the dictionary
  # @!attribute [r] ipa
  #   @return [String] pronunciation for English terms, in IPA
  # @!attribute [r] term
  #   @return [String] the defined term
  # @!attribute [r] latin_term
  #   @return [String] the defined term, spelled using Latin characters
  # @!attribute [r] zh
  #   @return [String] the defined term, in simplified Hanzi
  # @!attribute [r] zh_tw
  #   @return [String] the defined term, in complex Hanzi
  # @!attribute [r] defn
  #   @return [String] the term's definition, in English or pinyin
  # @!attribute [r] help_text
  #   @return [String] might be used in the dictionary app's help
  # @!attribute [r] example
  #   @return [String] text that shows how the term is used
  # @!attribute [r] grade
  #   @return [String] the level at which this term is taught; 'A' to 'E'
  # @!attribute [r] freq
  #   @return [String] floating-point number indicating the term's popularity;
  #       lower strings, such as "1" are associated with more popular terms;
  #       unpopular terms don't have this property set
  # @!attribute [r] measure_word
  #   @return [String, Array<String>] the key of the measure word than should
  #       be used with this noun; might be an array of dictionary keys instead
  # @!attribute [r] speech_part
  #   @return [String] abbreviation of the term's part of speech; cross
  #       reference this in the appropraite parts-of-speech database
  # @!attribute [r] serial
  #   @return [String] uniquely identifies a definition in the dictionary
  # @!attribute [r] example_translation
  #   @return [String] translation of the example usage text; if the text is in
  #       English, the translation uses pinyin
  # @!attribute [r] example_zh
  #   @return [String] the example usage text, in simplified hanzi
  # @!attribute [r] reference
  #   @return [String] code that indicates where the definition was obtained
  #       from; might be useful to researchers
  # @!attribute [r] term_frequency
  #   @return [String] the definition rank among all terms that are spelled the
  #       same; for Chinese terms, the spelling is pinyin; the most frequent
  #       term has rank 1
  # @!attribute [r] latin_frequency_boost
  #   @return [Boolean] if true, the term is the most frequent among all terms
  #       with the same Latin alphabet spelling; useful for ordering
  #       suggestions when the user is typing raw Latin characters; use the
  #       latin_term property to get a term's LAtin spelling
  # @!attribute [r] field
  #   @return [String] the term's field of reference, abbreviated in English
  # @!attribute [r] field_zh
  #   @return [String] the term's field of relevance, in simplified hanzi
  # @!attribute [r] unverified
  #   @return [Boolean] set on some auto-generated entries in en->zh
  # @!attribute [r] inflection
  #   @return [String] instructions on how to inflect an English word; not yet
  #       parsed, but in the future it should be an array of String words
  # @!attribute [r] extend
  #   @return [String] method for extending the term with a suffix to obtain a
  #       related meaning
  # @!attribute [r] extend_serial
  #   @return [String] the serial of the term obtained by extending this term
  #       with a suffix
  # @!attribute [r] extended_from
  #   @return [String] the term that this term was derived from
  # @!attribute [r] extended_from_serial
  #   @return [String] the serial of the term that this term was derived from
  # @!attribute [r] abbreviates
  #   @return [String] the term that this term is an abbreviation for
  # @!attribute [r] see_serial
  #   @return [String] the serial of the term that this term should be
  #       considered to be identical with
  # @!attribute [r] see_term
  #   @return [String] a term that is closely related to this term; unlike
  #       see_serial, this is rendered as a "See also " link
  # @!attribute [r] usage
  #   @return [String] short clarification about how the term is used
  # @!attribute [r] linked_terms
  #   @return [String] terms that have the same spelling in some system and
  #       and are closely related
  # @!attribute [r] linked_serials
  #   @return [String] serials for terms that have the same spelling in some
  #       system and are closely related
  # @!attribute [r] used_in_terms
  #   @return [String] terms that contain this term
  # @!attribute [r] used_in_serials
  #   @return [String] serials for terms that contain this term
  # @!attribute [r] construction
  #   @return [String] a grammatical construction that the term can be used in;
  #       the associated definition, examples, etc. all apply to the term's use
  #       in the construction
  # @!attribute [y] years
  #   @return [String] year / range of years that a person lived
  # @return [Hash]
  def to_hash
    Hash[each_pair.reject { |k, v| v.nil? }.to_a]
  end
end  # class WenlinDbScanner::DictEntry

end  # namespace WenlinDbScanner
