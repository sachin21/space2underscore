# coding: utf-8
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
      NAME:
         space2underscore - Change the space into underscore

      USAGE:
         $ space2underscore new branch -c
         =>  Switched to the new branch 'new_branch’

        Or

        $ git branch -m $(space2underscore renamed branch)

      VERSION:
         #{Space2underscore::VERSION}

      OPTIONS:
         --create, -c         create the new branch
    EOF

    print message.gsub('      ', '')
  end
end
