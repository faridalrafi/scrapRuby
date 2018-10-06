require 'twitter'
require 'yaml'

require 'uri'
require_relative 'scraping'


client = Twitter::REST::Client.new do |config|
 config.consumer_key        = "QMbo2SJEE9zfoEa8AITDdCVyW"
  config.consumer_secret     = "mpEQfxn0SmKL1BSzQ06mfDUY7rxceExhvHZhkfIvSKsn7oHmwY"
  config.access_token        = "86287053-tnmoPY2LbyNqBvmc3Bb1jNx8yPyk1xv0ziBA4qyLC"
  config.access_token_secret = "cJcyqTTHZAqmg6h4dyHjqSU8VVtkA2qMj5DpXBiacAP3S"
end

tweets = client.user_timeline('infoBMKG', count: 20)
regexp = "gagal"


tweets.each { |tweet| tweet_str = tweet.full_text
		tweet_url = URI.extract(tweet_str)
		begin
		str_url = tweet_url[0]
		if str_url[0,4] == "http"
		data = Scraping.new(str_url)
		puts " title berita : #{data.title} , isi berita : #{data.description} , URL gambar : #{data.image_url}"		
		else
		puts tweet_str
		end
		raise 'Error occured in Tweet URL'
		rescue
		puts tweet_str
		end
		 }


