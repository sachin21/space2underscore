# Space2underscore
## What
Convert to underscore the space

## Installation

Add this line to your application's Gemfile:

    gem 'space2underscore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install space2underscore

If your computer is linux

    $ sudo apt-get install xclip

You need to alias

    $ alias pbcopy='xclip -selection clipboard'

    $ alias pbpaste='xclip -selection clipboard -o'

## Usage

From the terminal:

    $ space2underscore target sentence
    => target_sentence  # copied to the clipboard

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

