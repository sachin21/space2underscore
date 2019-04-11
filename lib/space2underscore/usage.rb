# frozen_string_literal: true

module Space2underscore
  class Usage
    MESSAGE = <<-EOF.chomp
        NAME:
           space2underscore - Change the space into underscore

        USAGE:
           $ s2u new branch -c
           =>  Switched to the new branch 'new_branch’

          Or

          $ git branch -m $(s2u renamed branch)

        VERSION:
           #{Space2underscore::VERSION}

        OPTIONS:
           --create, -c         create a new branch
    EOF

    def content
      MESSAGE.gsub('        ', '')
    end
  end
end
