$stdout.sync = true
require "dotenv"
ENV["RACK_ENV"] ||= "development"
APP_ENV = ENV.fetch("RACK_ENV")
Dotenv.load(
  File.expand_path("../../.#{APP_ENV}.env", __FILE__),
  File.expand_path("../../.env",  __FILE__))
require "sinatra/base"

class Chirpscore < Sinatra::Base
  get "/hello" do
    "Hello Chirpscore!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
