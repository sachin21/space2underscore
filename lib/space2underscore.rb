require 'space2underscore/version'

module Space2underscore
  def self.convert(argv)
    argv.length == 1 ? argv[0].strip.gsub(/\s/,  '_') : argv.join('_')
  end

  def self.create_new_branch(underscore_include_sentence)
    system "git checkout -b #{underscore_include_sentence}"
  end

  def self.print_usage
    message = <<-EOF
      space2underscore #{Space2underscore::VERSION}
      Usage: space2underscore <branch name> <options>

      $ space2underscore new branch -c # Run with `--create` or `-c` options.
      =>  Switched to the new branch 'new_branch’

      Or

      $ git branch -m $(space2underscore renamed branch) # space2underscore has outputted to the standard output.
    EOF

    print message.gsub('      ', '')
  end
end
