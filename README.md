# Space2underscore

A CLI tool that converts spaces into underscores. Useful for creating or renaming Git branches.

[![Gem Version](https://badge.fury.io/rb/space2underscore.svg)](https://badge.fury.io/rb/space2underscore)
[![CI](https://github.com/sachin21/space2underscore/workflows/CI/badge.svg)](https://github.com/sachin21/space2underscore/actions)
[![Code Climate](https://codeclimate.com/github/sachin21/space2underscore/badges/gpa.svg)](https://codeclimate.com/github/sachin21/space2underscore)
[![Coverage Status](https://coveralls.io/repos/sachin21/space2underscore/badge.svg?branch=master&service=github)](https://coveralls.io/github/sachin21/space2underscore?branch=master)
[![Gem Downloads](https://img.shields.io/gem/dt/space2underscore.svg)](https://rubygems.org/gems/space2underscore)

## Requirements

- Ruby >= 2.4.0
- Git

## Installation

```
$ gem install space2underscore
```

## Usage

### Create a new branch

Use the `-c` (`--create`) option to create a new Git branch with spaces converted to underscores.

```
$ s2u new branch -c
=> Switched to a new branch 'new_branch'
```

### Rename an existing branch

Use `$(s2u ...)` as a subcommand.

```
$ git branch -m $(s2u renamed branch)
```

### Print the converted string

Without any options, the converted string is printed to stdout. By default, the output is downcased.

```
$ s2u Hello World
hello_world
```

### Preserve original case

Use the `-r` (`--raw`) option to keep the original letter casing.

```
$ s2u Hello World -r
Hello_World
```

### Options

| Option | Short | Description |
|---|---|---|
| `--create` | `-c` | Create a new Git branch with the converted name |
| `--raw` | `-r` | Preserve original letter casing (skip downcase) |

## Caution

This is a command line tool. **DO NOT** include this module in other Ruby applications, as it uses the `system` command internally, which may introduce command injection vulnerabilities.

## License

[MIT License](MIT-LICENSE) - Copyright (c) 2014 Satoshi Ohmori
