# FixtureToFactory

Quick and dirty conversion from fixtures to factory girl factories.
It's just to save time if you have a bunch of fixtures you need to make factories out of.
The conversion is dumb so it just makes basic factories from the fixtures - basic value attributes. You can then copy/paste/alter the dumb factories into real ones!

Looks in ./test/fixtures and ./spec/fixtures

Output goes into ./test/factories or ./spec/factories.
Output files look like generated_#{fixutre_name}.rb


## Installation

Add this line to your application's Gemfile:

    gem 'fixture_to_factory'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fixture_to_factory

## Usage

  Navigage to the base of your project directory and then run `fixture_to_factory`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
