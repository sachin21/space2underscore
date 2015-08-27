require 'space2underscore/version'

module Space2underscore
  class << self
    def convert(argv)
      argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
    end

    def create_new_branch(underscore_include_sentence)
      if system "git checkout -b #{underscore_include_sentence}"
        "Branch has been created."
      end
    end
  end
end
