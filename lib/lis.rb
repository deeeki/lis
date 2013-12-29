require 'lis/parser'
require 'lis/serializer'
require 'lis/version'

module Lis
  class ParseError < StandardError; end

  module_function

  def parse text
    Parser.parse(text)
  end

  def serialize hash
    Serializer.serialize(hash)
  end
  alias :stringify :serialize
end
