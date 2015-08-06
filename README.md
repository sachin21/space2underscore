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
    =>  Switched to the new branch 'new_branch’
    =>  Branch has been created.

# Example of use

![example of use](http://i.imgur.com/1teIk4j.png)

From the terminal:

    $ space2underscore add stock function to user feed # underscore included branch name is copied to clipboard
    $ git checkout -b add_stock_function_to_user_feed # paste

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
