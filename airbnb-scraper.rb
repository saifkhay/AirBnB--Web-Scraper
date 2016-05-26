require 'open-uri'
require 'nokogiri'
require 'csv'
url = "https://www.airbnb.ca/s/Linz--Austria"
page = Nokogiri::HTML(open(url))

name = []
page.css('div.h5.listing-name').each do |info|
	name << info.text
end


price=[]
puts page.css('span.h3.price-amount').each do |info|
	price << info.text
end

location =[]
puts page.css('div.text-mutes.listing-location.text-truncate').each do |info|
	location << info.text
end

CSV.open("airbnb_listing.csv", "w") do |file|
	name.length.times do |i|
	file << [name[i], price[i], location[i]]
	end
end

#puts page.css('toclevel-1').each do |vikingz|
#	puts vikingz.text
#end