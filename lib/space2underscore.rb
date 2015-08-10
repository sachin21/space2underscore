require 'space2underscore/version'

module Space2underscore
  class << self
    def convert(argv)
      argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
    end

    def generate_command(underscore_include_sentence)
      "echo #{underscore_include_sentence} | ruby -pe 'chomp' | #{copy_cmd}"
    end

    def execute_command(command)
      system command
    end

    def copy_cmd
      if system("type pbcopy > /dev/null 2>&1")
        "pbcopy"
      elsif system("type xsel > /dev/null 2>&1")
        "xsel --input --clipboard"
      elsif system("type xclip > /dev/null 2>&1")
        "xclip"
      end
    end

    def create_new_branch(underscore_include_sentence)
      print "Do you create the new branch? [y/Y]"
      flag = $stdin.gets.chomp

      if !!(flag =~ /^y(es)?$/i) || flag == ''
        system "git checkout -b #{underscore_include_sentence}"
        "Branch has been created."
      else
        execute_command(generate_command(underscore_include_sentence))

        "Branch name has been copied to clipboard."
      end
    end
  end
end
