# Space2underscore

![Gem Version](https://badge.fury.io/rb/space2underscore.svg) [![Build Status](https://travis-ci.org/sachin21/space2underscore.svg?branch=master)](https://travis-ci.org/sachin21/space2underscore) [![Code Climate](https://codeclimate.com/github/sachin21/space2underscore/badges/gpa.svg)](https://codeclimate.com/github/sachin21/space2underscore) [![Coverage Status](https://coveralls.io/repos/sachin21/space2underscore/badge.svg?branch=master&service=github)](https://coveralls.io/github/sachin21/space2underscore?branch=master) [![Gem](https://img.shields.io/gem/dt/space2underscore.svg)]()

## What is space2underscore
Change the space into underscore.
space2underscore is a useful command when you want to check out a branch.

## Installation
Install it yourself as:

    $ gem install space2underscore

## Usage
From the command line:

### 1. e.g. Create the new branch

```
$ space2underscore new branch -c
=>  Switched to the new branch 'new_branch’
```

Run with `--create` or `-c` options.

### 2. e.g. Rename the already created a branch

```
$ git branch -m $(space2underscore renamed branch)
```

When option is nothing, space2underscore has outputted to the standard output.

## Shorthand

A shorthand alias for space2underscore can also be used.

```
s2u new branch
```

## Credits
- Help information based on [@motemen's ghq](https://github.com/motemen/ghq)
- Installed information based on [Tmuxinator](https://github.com/tmuxinator/tmuxinator)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
