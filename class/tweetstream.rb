#require 'tweetstream'
require 'twitter'
require 'uri'
require_relative 'scraping'
def run_stream
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
  	
	tweet_url = URI.extract(tweet_post)
	begin
		str_url = tweet_url[0]
		if str_url[0,4] == "http"
		data = Scraping.new(str_url)
		puts " title berita : #{data.title} , isi berita : #{data.description} , URL gambar : #{data.image_url}"		
		else
		puts tweet_post 
		end
		raise 'Error occured in Tweet URL'
		rescue
		puts tweet_post
		end
end
end
end

run_stream
