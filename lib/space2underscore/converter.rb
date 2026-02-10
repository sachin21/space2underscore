# frozen_string_literal: true

module Space2underscore
  # Converts spaces to underscores in branch names
  class Converter
    class << self
      # Convert input to branch name with underscores
      #
      # @param input [Array<String>] Input words
      # @return [String] Branch name with underscores
      def convert(input)
        return '' if input.empty?

        if input.length == 1
          # Single argument: "foo bar" -> "foo_bar"
          input[0].strip.gsub(/\s+/, '_')
        else
          # Multiple arguments: ["foo", "bar"] -> "foo_bar"
          input.join('_')
        end
      end
    end
  end
end
