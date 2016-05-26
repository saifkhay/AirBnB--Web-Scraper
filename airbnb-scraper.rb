require 'open-uri'
require 'nokogiri'

url = "https://www.airbnb.ca/s/Brooklyn--NY--United-States"
page = Nokogiri::HTML(open(url))

page.css('div.h5.listing-name').each do |info|
	puts info.text
end

puts page.css('span.h3.price-amount').each do |info|
	puts info.text
end

puts page.css('div.text-mutes.listing-location.text-truncate').each do |info|
	puts info.text
end