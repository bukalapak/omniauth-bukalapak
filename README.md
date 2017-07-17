# Omniauth::Bukalapak

[![Build Status](https://travis-ci.org/bukalapak/omniauth-bukalapak.svg?branch=master)](https://travis-ci.org/bukalapak/omniauth-bukalapak)
[![Code Climate](https://codeclimate.com/github/bukalapak/omniauth-bukalapak/badges/gpa.svg)](https://codeclimate.com/github/bukalapak/omniauth-bukalapak)
[![Gem](https://img.shields.io/gem/v/omniauth-bukalapak.svg)](https://rubygems.org/gems/omniauth-bukalapak)

Official OmniAuth strategy for authenticating with [Bukalapak](https://www.bukalapak.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-bukalapak'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-bukalapak

## Usage

```ruby
use OmniAuth::Builder do
  provider :bukalapak, ENV['BUKALAPAK_KEY'], ENV['BUKALAPAK_SECRET']
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bukalapak/omniauth-bukalapak.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

