require 'twitter'
require 'yaml'

require 'uri'



client = Twitter::REST::Client.new do |config|
 config.consumer_key        = "QMbo2SJEE9zfoEa8AITDdCVyW"
  config.consumer_secret     = "mpEQfxn0SmKL1BSzQ06mfDUY7rxceExhvHZhkfIvSKsn7oHmwY"
  config.access_token        = "86287053-tnmoPY2LbyNqBvmc3Bb1jNx8yPyk1xv0ziBA4qyLC"
  config.access_token_secret = "cJcyqTTHZAqmg6h4dyHjqSU8VVtkA2qMj5DpXBiacAP3S"
end

tweets = client.user_timeline('infoBMKG', count: 20)
regexp = "gagal"


tweets.each { |tweet| tweet_str = tweet.full_text
		tweet_url = URI.extract(tweet_str) }


