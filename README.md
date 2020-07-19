# Parameterised Paths

A little gem for matching potentially parameterised paths

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parameterised-paths'
```

Or add this line to your gemspec

```ruby
spec.add_dependency 'parameterised-paths'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install parameterised-paths
```

## Usage

### Simple Paths

```ruby
require 'parameterised/paths'

path = Parameterised::Paths::Path.new('/hello/world')

match = path.match('/hello/world')

raise 'Paths do not match' if match.nil?
```

### Parameter Paths

```ruby
require 'parameterised/paths'

path = Parameterised::Paths::Path.new('/hello/:param')

match = path.match('/hello/world')

# Access parameter
param = match.params['param']
```

### Shorthand methods

```ruby
require 'parameterised/paths'

# Creating a path
path = Parameterised::Paths.path('/hello/world')

# Quick match
match = Parameterised::Paths.match('/hello/world', '/hello/developer')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/chrisBirmingham/parameterised-paths).
