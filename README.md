# Brave

This library allows you to do method chaining or to run an arbitrary block of code without the hassle of dealing directly with either NoMethodError or a specific list of exceptions the block could raise.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brave'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brave

## Usage

```ruby
require "brave"

hash = {foo: "bar"}

hash[:foo].length # 3
hash[:boo].length # NoMethodError

Brave.be { hash[:foo].length } # 3
Brave.be { hash[:boo].length } # nil

class Person
  attr_accessor :name
end

person_a = Person.new
person_a.name = "Foo"

person_b = Person.new

person_a.name.upcase # "FOO"
person_b.name.upcase # NoMethodError

Brave.be { person_a.name.upcase } # "Foo"
Brave.be { person_b.name.upcase } # nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/brave. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
