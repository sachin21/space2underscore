# Space2underscore
## What is space2underscore
Change the space into underscore.

space2underscore is a useful command when you want to check out a branch.

## Installation

Add this line to your application's Gemfile:

    gem 'space2underscore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install space2underscore

If your computer is Ubuntu then

    $ sudo apt-get install xsel

If your computer is CentOS then

    $ sudo yum -y install xsel

## Usage

From the terminal:

    $ space2underscore new branch
    => Do you create the new branch? [y/Y] # y
    =>  Switched to the new branch 'new_branch’
    =>  Branch has been created.

Or

    $ space2underscore renamed branch
    => Do you create the new branch? [y/Y/Yes, n/N/No] # n
    => Branch name has been copied to clipboard.
    $ git branch -m renamed_branch # Paste from clipboard

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
