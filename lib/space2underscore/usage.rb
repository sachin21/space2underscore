module Space2underscore
  class Usage
    MESSAGE = <<-EOF.chomp
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
           --create, -c         create a new branch
    EOF

    def content
      MESSAGE.gsub('        ', '')
    end
  end
end
