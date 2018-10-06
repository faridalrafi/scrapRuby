require 'open-uri'
require 'nokogiri'
require 'open_uri_redirections'

class Scraping
    def initialize(url_tweet)
        @url_tweet = url_tweet.to_s
        @doc = Nokogiri::HTML(open(@url_tweet,:allow_redirections => :all))
    end
    def parsing
        doc = Nokogiri::HTML(open(@url_tweet,:allow_redirections => :all))
        @doc = doc
        #print doc.xpath("//title")
        @title = doc.at("meta[property='og:title']")['content']
        @description = doc.at("meta[name='description']")['content']
        #ActionView::Base.full_sanitizer.sanitize(description)
        #puts description
        @image =  doc.at("meta[property='og:image']")['content']
    end
    def title
        @title = @doc.at("meta[property='og:title']")['content']
        return @title
    end
    def description
        @description = @doc.at("meta[name='description']")['content']
        return @description
    end
    def image_url
        @image = @doc.at("meta[property='og:image']")['content']
        return @image
    end
    
end

