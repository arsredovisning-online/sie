require "attr_extras"
require "sie/parser/line_parser"

module Sie
  class Parser
    # TODO: Could this format knowledge be centrailized somewhere, some
    # of this is duplicated in Character.
    BEGINNING_OF_ARRAY = "{"
    END_OF_ARRAY       = "}"
    ENTRY              = /^#/

    def parse(io)
      stack = []
      sie_file = SieFile.new
      current = sie_file

      io.each_line do |line|
        line = line.chomp

        case line
        when BEGINNING_OF_ARRAY
          stack << current
          current = current.entries.last
        when END_OF_ARRAY
          current = stack.pop
        when ENTRY
          current.entries << parse_line(line)
        end
      end

      sie_file
    end

    private

    def parse_line(line)
      LineParser.new(line).parse
    end
  end
end