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
    tweets = client.user_timeline(params[:handle])

    analyzer = Sentimental.new

    results = tweets.inject(0) { |a, e| a + analyzer.get_score(e.text) }
    results /= tweets.length
    results = sprintf("%0.02f", results * 10)
    <<EOS
    <html>
        <body>
        #{results}
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
