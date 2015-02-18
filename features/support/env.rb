ENV["RACK_ENV"] = "test"

require File.join(File.dirname(__FILE__), "..", "..", "app","app.rb")

require "capybara"
require "capybara/cucumber"
require "rspec"
require "vcr"

Capybara.app = Chirpscore

class ChirpscoreWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChirpscoreWorld.new
end

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end
