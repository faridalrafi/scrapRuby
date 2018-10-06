require 'open-uri'
require 'nokogiri'
require 'open_uri_redirections'
doc = Nokogiri::HTML(open("https://t.co/astYFmtLIB",:allow_redirections => :all))

#print doc.xpath("//title")
print doc.at("meta[property='og:title']")['content']
description = doc.at("meta[name='description']")['content']
#ActionView::Base.full_sanitizer.sanitize(description)

puts description
puts doc.at("meta[property='og:image']")['content']
