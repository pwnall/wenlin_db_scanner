module WenlinDbScanner

# Wraps record data returned by WenlinDbScanner::Db methods.
class DbRecord
  # @return {Boolean} true if the record has non-text data, such as pictures
  attr_reader :binary
  alias_method :binary?, :binary

  # @return {String, nil} UTF-8 encoded text data; nil for binary records
  attr_reader :text

  # @return {String, nil} ASCII-8BIT encoded binary data; nil for text records
  attr_reader :data

  # @return {Fixnum} the record's tag byte (a number in 0...256)
  attr_reader :tag

  # Raw data size, in bytes.
  #
  # For text records, this is the size of the compressed data.
  attr_reader :size

  # The record's position in the database.
  attr_reader :offset

  # Used by the WenlinDbScanner::Db methods.
  def initialize(offset, tag, size, binary, data)
    @offset = offset
    @tag = tag
    @size = size
    @binary = binary
    if @binary
      @data = data
      @text = nil
    else
      @text = data
      @data = nil
    end
  end
end  # class WenlinDbScanner::DbRecord

end  # namespace WenlinDbScanner

