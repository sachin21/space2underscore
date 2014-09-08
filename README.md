# Space2underscore
## What
Change the space into underscore.

## Installation

Add this line to your application's Gemfile:

    gem 'space2underscore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install space2underscore

If your computer is Ubuntu

    $ sudo apt-get install xsel

If your computer is CentOS

    $ sudo yum -y install xsel

You need to alias

    $ alias pbcopy='xsel --clipboard --input'

## Usage

From the terminal:

    $ space2underscore target sentence
    => target_sentence  # copied to the clipboard

# Example of use

![example of use](https://raw.githubusercontent.com/sachin21/space2underscore/master/img/screenshot.png)

From the terminal:

    $ space2underscore add stock function to user feeed
    $ git checkout -b add_stock_function_to_user_feeed

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

