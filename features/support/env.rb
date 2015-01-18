ENV["RACK_ENV"] = "test"

require File.join(File.dirname(__FILE__), "..", "..", "app","app.rb")

require "capybara"
require "capybara/cucumber"
require "rspec"

Capybara.app = Chirpscore

class ChirpscoreWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChirpscoreWorld.new
end
