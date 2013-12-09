# RandomStrings

This gem helps you generate random string of various "types" - a random email, a random date, a random Twitter handle, etc. Or just a random string.

It's a great gem to use when creating seeds for database applications - like in a Rails seeds.rb file, for example. (hint, hint.)

## Installation

Add this line to your application's Gemfile:

    gem 'random_strings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_strings

## Usage

Initialize like this:

    @my_gen = RandomStrings::Generator.new do |config|
      config.default_string_length=7
      config.default_number_length=6
      config.tld_list=['.net', '.my', '.ly']
    end

Here are a few functions you can use:

    @generator=RandomStrings::Generator.new
    a_zip=@generator.random_zip # Will look like, 40072
    an_email=@generator.random_email # Will look, uuyhWAAJne@uuqVGjEaka.net

These are composed from the following basic functions:

    RandomStrings::Generator#random_digits
    RandomStrings::Generator#random_string


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
