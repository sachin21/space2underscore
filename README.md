# Space2underscore

![Gem Version](https://badge.fury.io/rb/space2underscore.svg) [![Build Status](https://travis-ci.org/sachin21/space2underscore.svg?branch=master)](https://travis-ci.org/sachin21/space2underscore) [![Code Climate](https://codeclimate.com/github/sachin21/space2underscore/badges/gpa.svg)](https://codeclimate.com/github/sachin21/space2underscore) [![Coverage Status](https://coveralls.io/repos/sachin21/space2underscore/badge.svg?branch=master&service=github)](https://coveralls.io/github/sachin21/space2underscore?branch=master) [![Gem](https://img.shields.io/gem/dt/space2underscore.svg)](https://rubygems.org/gems/space2underscore)

## What is space2underscore
Change the space into underscore.
space2underscore is a useful command when you want to check out a branch.

## Installation
Install it yourself as:

```
$ gem install space2underscore
```

## Usage
From the command line:

### 1. e.g. Create the new branch

```
$ s2u new branch -c
=>  Switched to a new branch 'new_branch’
```

Run with `--create` or `-c` options.

### 2. e.g. Rename the already created a branch

```
$ git branch -m $(s2u renamed branch)
```

## !! Cation !!
This is a command line tool. So DO NOT include all modules because it uses `system` command. So crackers will be attacking your application.

## Credits
- Help information based on [@motemen's ghq](https://github.com/motemen/ghq)
- Installed information based on [Tmuxinator](https://github.com/tmuxinator/tmuxinator)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
