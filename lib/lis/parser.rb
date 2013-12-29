module Lis
  class Parser
    def self.parse *args
      new(*args).parse
    end

    def initialize text
      @text = text
      @current_depth = 0
      @prev_depth = 0
      @hashes = [] # to store hashes for each depth
      @parent_strs = [] # to store parent key strings for each depth
    end

    def parse
      @text.each_line do |line|
        @current_depth = (line =~ /^(-+)/) ? $1.size : 0
        raise ParseError if @current_depth - @prev_depth > 1

        str = line.delete('-').chomp.strip
        @hashes[@current_depth] ||= {}
        @hashes[@current_depth][str] = nil

        if @current_depth < @prev_depth
          merge_descendants(@prev_depth, @current_depth)
        end
        @parent_strs[@current_depth] = str

        @prev_depth = @current_depth
      end
      merge_descendants(@prev_depth, 0) if @prev_depth > 0

      if @hashes.first.values.none?
        @hashes.first.keys
      else
        @hashes.first
      end
    end

    private

    def merge_descendants from_depth, to_depth = 0
      depth = from_depth
      loop do
        depth = depth - 1
        parent_str = @parent_strs[depth]
        if @hashes[depth + 1].values.none? # merge the deepest items as array
          @hashes[depth][parent_str] = @hashes[depth + 1].keys
        else # merge middle items as hash
          @hashes[depth][parent_str] = @hashes[depth + 1].dup
        end
        @hashes[depth + 1].clear # clear merged hash
        break if depth == to_depth
      end
    end
  end
end
