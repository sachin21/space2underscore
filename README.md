# Space2underscore [![Build Status](https://travis-ci.org/sachin21/space2underscore.svg?branch=master)](https://travis-ci.org/sachin21/space2underscore)

## What is space2underscore
Change the space into underscore.
space2underscore is a useful command when you want to check out a branch.

## Installation
Install it yourself as:

    $ gem install space2underscore

## Usage
From the terminal:

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
