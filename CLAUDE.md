# Project Overview

A CLI tool that converts spaces to underscores, primarily designed for Git branch operations. The `s2u` command helps create or rename branches with underscores instead of spaces.

## Language Settings

- **Thinking/Reasoning**: English
- **Code**: English (variable names, function names, comments)
- **User Communication**: Japanese

## Tech Stack

- **Language**: Ruby (>= 2.4.0)
- **Package Manager**: Bundler, RubyGems
- **Testing**: RSpec
- **Dev Tools**: Pry (debugger), Rubocop (linter), Coveralls (coverage)

## Common Commands

```bash
# Install dependencies
bundle install

# Run tests
bundle exec rake
# or
bundle exec rake spec

# Run tests with coverage
bundle exec rake spec:with_coveralls

# Create version tag
bundle exec rake tag

# Install gem locally
gem build space2underscore.gemspec
gem install space2underscore-*.gem
```

## Project Structure

```
space2underscore/
├── bin/              # Executable files (s2u command)
├── lib/              # Library code
│   └── space2underscore/
├── spec/             # RSpec tests
├── Gemfile           # Gem dependencies
├── Rakefile          # Rake tasks
└── space2underscore.gemspec  # Gem specification
```

## Development Workflow

1. Make changes to code in `lib/`
2. Add/update tests in `spec/`
3. Run tests: `bundle exec rake spec`
4. Ensure Rubocop compliance
5. Commit changes (English commit messages)

## Security Note

**IMPORTANT**: This tool uses `system` commands internally. DO NOT include this gem as a module in other Ruby applications as it may introduce security vulnerabilities (command injection risks).
