$stdout.sync = true
require "dotenv"
ENV["RACK_ENV"] ||= "development"
APP_ENV = ENV.fetch("RACK_ENV")
Dotenv.load(
  File.expand_path("../../.#{APP_ENV}.env", __FILE__),
  File.expand_path("../../.env",  __FILE__))
require "sinatra/base"

class Chirpscore < Sinatra::Base
  get '/' do
    <<EOS
    <form method="post" action="/result">
      <input type=text name=handle />
      <input type=submit value='go go go!!!!' />
    </form>
EOS
  end

  post '/result' do
    '2.27'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
