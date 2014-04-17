require "active_support"
require "fixture_to_factory/version"
require "fixture_to_factory/fixture_file_parser"
require "fixture_to_factory/factory_writer"

require 'pry'

module FixtureToFactory
  def self.execute(options)
    ['./test', './spec'].each do |folder|
      prefix = options.delete(:prefix) || ''
      folder = "#{prefix}#{folder}"

      # This looks in a directory given and returns the fixtures in a hash form
      # filename => [fixture1, fixture2]
      parsed_fixtures = FixtureFileParser.parse_files("#{folder}/fixtures")

      # Then we pass the hashes to the writer to convert them into factory files
      FactoryWriter.write_files("#{folder}/factories", parsed_fixtures)
    end
  end
end
