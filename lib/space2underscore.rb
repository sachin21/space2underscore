require 'space2underscore/version'

module Space2underscore
  class << self
    def convert(argv)
      argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
    end

    def create_new_branch(underscore_include_sentence)
      system "git checkout -b #{underscore_include_sentence}"
    end
  end
end
