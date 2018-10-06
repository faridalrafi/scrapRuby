require 'tweetstream'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "QMbo2SJEE9zfoEa8AITDdCVyW"
  config.consumer_secret     = "mpEQfxn0SmKL1BSzQ06mfDUY7rxceExhvHZhkfIvSKsn7oHmwY"
  config.access_token        = "86287053-tnmoPY2LbyNqBvmc3Bb1jNx8yPyk1xv0ziBA4qyLC"
  config.access_token_secret = "cJcyqTTHZAqmg6h4dyHjqSU8VVtkA2qMj5DpXBiacAP3S"
end

topics = ["infobmkg", "bmkg", "#BMKG"]
client.filter(track: topics.join(",")) do |object|
  tweet_user = object.user.id
  tweet_post = object.text if object.is_a?(Twitter::Tweet)
  if tweet_post[0,3] != "RT "
  	puts tweet_user
end
end
