# frozen_string_literal: true

module Space2underscore
  # Main CLI orchestrator
  class Cli
    def initialize(argv)
      @argv = argv
    end

    def start
      options = OptionsParser.parse(@argv)

      # Show usage if no arguments
      return display_usage unless options

      # Convert input to branch name
      branch_name = Converter.convert(options.input)

      # Apply case transformation
      branch_name = branch_name.downcase if options.downcase

      # Execute action
      case options.action
      when :create
        BranchCreator.create(branch_name)
      when :print
        OutputPrinter.print(branch_name)
      end
    rescue OptionsParser::ParseError => e
      $stderr.puts "Error: #{e.message}"
      exit 1
    end

    private

    def display_usage
      $stdout.puts Usage.new.content
    end
  end
end
