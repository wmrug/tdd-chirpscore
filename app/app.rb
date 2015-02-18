$stdout.sync = true
require "dotenv"
require "sentimental"
require "twitter"

ENV["RACK_ENV"] ||= "development"
APP_ENV = ENV.fetch("RACK_ENV")
Sentimental.load_defaults
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
    <<EOS
    <html>
        <body>
        #{ChirpscoreCalculator.calculate(params[:handle])}
        </body>
    </html>
EOS
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

class ChirpscoreCalculator
  def self.calculate(handle)
    if handle.include? " "
      results = "invalid handle"
    else
      tweets = client.user_timeline(handle)
    end

    analyzer = Sentimental.new

    results = tweets.inject(0) { |a, e| a + analyzer.get_score(e.text) }
    results /= tweets.length
    results = sprintf("%0.02f", results * 10)
    results
  end
end
