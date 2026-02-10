# frozen_string_literal: true

module Space2underscore
  # Represents parsed command-line options
  Options = Struct.new(:action, :input, :downcase, keyword_init: true)

  # Parses command-line arguments into Options
  class OptionsParser
    CREATE_FLAGS = %w[-c --create].freeze
    RAW_FLAGS = %w[-r --raw].freeze
    ALL_FLAGS = (CREATE_FLAGS + RAW_FLAGS).freeze

    ParseError = Class.new(ArgumentError)

    class << self
      # Parse argv into Options object
      #
      # @param argv [Array<String>] Command-line arguments
      # @return [Options, nil] Parsed options or nil if empty
      # @raise [ParseError] If arguments are invalid
      def parse(argv)
        return nil if argv.empty? # Triggers usage display

        has_create = argv.any? { |arg| CREATE_FLAGS.include?(arg) }
        has_raw = argv.any? { |arg| RAW_FLAGS.include?(arg) }
        input = argv.reject { |arg| ALL_FLAGS.include?(arg) }

        validate_input!(input)

        Options.new(
          action: has_create ? :create : :print,
          input: input,
          downcase: !has_raw # raw flag means preserve case
        )
      end

      private

      def validate_input!(input)
        raise ParseError, 'Branch name is required' if input.empty?
      end
    end
  end
end
