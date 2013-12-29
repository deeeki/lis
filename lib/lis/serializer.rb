module Lis
  class Serializer
    def self.serialize hash, depth = 0
      return hash.map{|str| "#{str}\n" }.join if hash.is_a?(Array)
      text = ""
      hash.each do |parent, children|
        if children.is_a?(Hash)
          children_text = serialize(children, depth + 1)
        else
          children = [children] unless children.is_a?(Array)
          children_text = children.map{|child| "#{"-" * (depth + 1)}#{child}\n" }.join
        end
        text << "#{"-" * depth}#{parent}\n#{children_text}"
      end
      text
    end
  end
end
