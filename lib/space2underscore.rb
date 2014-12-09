require 'space2underscore/version'

module Space2underscore
  class << self
    def convert(argv)
      argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
    end

    def generate_command(space_include_sentence)
      if find_executable("pbcopy")
        "echo #{space_include_sentence} | ruby -pe 'chomp' | pbcopy"
      elsif find_executable("xsel")
        "echo #{space_include_sentence} | ruby -pe 'chomp' | xsel --input --clipboard"
      elsif find_executable("xclip")
        "echo #{space_include_sentence} | ruby -pe 'chomp' | xclip"
      end
    end
  end
end
