require 'space2underscore/version'

module Space2underscore
  class << self
    def convert(argv)
      argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
    end

    def copy_command(space_include_sentence)
      "echo #{space_include_sentence} | ruby -pe 'chomp' | pbcopy"
    end
  end
end
