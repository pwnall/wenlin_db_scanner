# coding: utf-8

require 'rexml/document'

module WenlinDbScanner

# Parses the data in the character (hanzi) databases.
module Chars
  # The entries in the database that breaks down hanzi into components.
  #
  # @param [String] db_root the directory containing the .db files
  # @return [Enumerator<Hash>]
  def self.hanzi(db_root)
    _hanzi File.join(db_root, 'cdl.db')
  end

  # Decoder for a CDL database.
  #
  # @param [String] db_file path to the .db file containing CDL data
  # @return [Enumerator<Hash>]
  def self._hanzi(db_file)
    Enumerator.new do |yielder|
      db = Db.new db_file
      db.records.each do |record|
        next if record.binary?
        xml = REXML::Document.new record.text

        entry = {}
        xml.root.attributes.each do |name, raw_value|
          key = name.to_sym
          entry[key] = cdl_attribute_value key, raw_value
        end

        entry[:parts] = xml.root.elements.map do |element|
          part = { part: element.name.to_sym }
          element.attributes.each do |name, raw_value|
            key = name.to_sym
            part[key] = cdl_attribute_value key, raw_value
          end
          part
        end

        yielder << entry
      end
    end
  end

  # Decodes known attributes for CDL XML elements.
  #
  # @param [Symbol] key the attribute's name, symbolized
  # @param [String] value the attribute's value
  # @return [Integer, Array, String] a more programmer-friendly value
  def self.cdl_attribute_value(key, raw_value)
    case key
    when :points  # coordinates
      raw_value.split(' ').map do |pair|
        pair.split(',').map { |coord| coord.strip.to_i }
      end
    when :radical  # dictionary radicals?
      raw_value.strip.split(' ').map(&:strip)
    when :type  # stroke type
      raw_value.strip.to_sym
    when :uni  # unicode value
      raw_value.strip.to_i(16)
    else
      raw_value.strip
    end
  end

  # The entries in the hanzi -> English meaning dictionary.
  #
  # @param [String] db_root the directory containing the .db files
  # @return [Enumerator<CharMeaning>]
  def self.hz_en(db_root)
    _hz_en File.join(db_root, 'zidian.db')
  end

  # Decodeder for a database of hanzi -> English meaning entries.
  #
  # @param [String] db_file path to the .db file containing dictionary data
  # @return [Enumerator<DictEntry>]
  def self._hz_en(db_file)
    Enumerator.new do |yielder|
      db = Db.new db_file
      db.records.each do |record|
        next if record.binary?
        lines = record.text.split("\n").map(&:strip).reject(&:empty?)

        header = lines[0]

        entry = CharMeaning.new
        entry.char = header[0, 1]
        header = header[1..-1]

        entry.pinyin = header.scan(/\[([^\]]*)\]/).
                              map { |match| match.first.strip }
        entry.latin_pinyin =
            entry.pinyin.map { |pinyin| pinyin_to_latin pinyin }.uniq
        header.gsub!(/\[[^\]]*\]/, '')
        header.strip!

        header.scan(/\([^\)]+\)/).each do |aside|
          aside_text = aside[1...-1]
          case aside_text[0]
          when '='
            entry.variants = aside_text[1..-1].chars.
                reject { |c| c.codepoints.first < 128 }
            header.gsub! aside, ''
          when '!', '?'
            entry.related ||= []
            entry.related += aside_text[1..-1].chars.
                reject { |c| c.codepoints.first < 128 }
            header.gsub! aside, ''
          when 'F'
            entry.complex_forms = aside_text[1..-1].chars.
                reject { |c| c.codepoints.first < 128 }
            header.gsub! aside, ''
          when 'S'
            entry.simplified_forms = aside_text[1..-1].chars.
                reject { |c| c.codepoints.first < 128 }
            header.gsub! aside, ''
          when 'u', 'U'
            if /^Unihan/i =~ aside_text
              header.gsub! aside, ''
            end
          end
        end
        header.strip!
        # Many definitions start with a (note).
        if note_match = /^\(([^\)]*)\)/.match(header)
          entry.note = note_match[1]
          header = header[note_match[0].length..-1].strip
        end
        entry.meaning = header.gsub(/\s*<hr\s*\/?>\s*/, "\n")

        lines[1..-1].each do |line|
          unless line[0] == ?#
            if entry.note
              entry.note << "/ #{line}"
            else
              entry.note = line
            end
            next
          end

          tag, data = line[1], line[2..-1].strip
          case 'tag'
          when 'c'
            entry.components = data.chars.
                reject { |c| c.codepoints.first < 128 }
          when 'r'
            # NOTE: skipping remarks
          when 'y'
            entry.cantonese = data
          end
        end

        yielder << entry
      end
    end
  end

  # Removes the accents from a pinyin string.
  #
  # This computes the closest Latin alphabet string matching the given pinyin
  # string. It is what users will most likely type to refer to the character,
  # word or phrase inside the pinyin-spelling string.
  #
  # @param [String] pinyin a string that uses pinyin spelling
  # @return [String] the closest approximation to the given string that only
  #     uses Latin characters
  def self.pinyin_to_latin(pinyin)
    pinyin.tr 'āēīōūǖĀĒĪŌŪǕáéíóúǘÁÉÍÓÚǗǎěǐǒǔǚǍĚǏǑǓǙàèìòùǜÀÈÌÒÙǛüÜ',
              'aeiouvAEIOUVaeiouvAEIOUVaeiouvAEIOUVaeiouvAEIOUVvV'
  end
end  # module WenlinDbScanner::Dicts

# Wraps a record in a dictionary database
class CharMeaning < Struct.new(:char, :meaning, :note, :pinyin, :variants,
                               :complex_forms, :simplified_forms,
                               :components, :cantonese, :related,
                               :latin_pinyin)
  # @!attribute [r] char
  #   @return [String] 1-character string containing the defined character
  # @!attribute [r] meaning
  #   @return [String] the character's definition, in English
  # @!attribute [r] note
  #   @return [String] e.g., "same as X" or
  # @!attribute [r] pinyin
  #   @return [Array<String>] pinyin pronunciation(s) of the character
  # @!attribute [r] latin_pinyin
  #   @return [Array<String>] pinyin pronunciation(s) of the character, with
  #       with the accents removed; this is what users type to get the
  #       character
  # @!attribute [r] variants
  #   @return [Array<String>] other variants of the character
  # @!attribute [r] related
  #   @return [Array<String>] characters that are somehow related
  # @!attribute [r] simplified_forms
  #   @return [Array<String>] simplified variants of the character
  # @!attribute [r] complex_forms
  #   @return [Array<String>] this character is a simplified variant of them
  # @!attribute [r] components
  #   @return [Array<String>] 1-character strings with characters that are
  #       contained in this character's image
  # @!attribute [r] cantonese
  #   @return [Array<String>] character's pronunciation in Cantonese

  # @return [Hash]
  def to_hash
    Hash[each_pair.reject { |k, v| v.nil? }.to_a]
  end
end  # class WenlinDbScanner::DictEntry

end  # namespace WenlinDbScanner
