require 'bundler/setup'
Bundler.setup

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'fixture_to_factory'

RSpec.configure do |config|
  # some (optional) config here
end
