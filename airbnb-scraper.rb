require 'open-uri'
require 'nokogiri'
require 'csv'
url = "https://www.airbnb.ca/s/Linz--Austria"
#response = Net::HTTP.get_response(URI.parse('http://www.google.co.uk/sorry/?continue=http://www.google.co.uk/search%3Fq%3Dhello%26oq%3Dhello%26ie%3DUTF-8'))
page = Nokogiri::HTML(open(url))

#scraper pages til max number of them 
page_numbers = []
page.css=("div.pagenation ul li a[target]").each do |info|
	page_number << info.text
end

max_page = page_numbers.max 
	url = "https://www.airbnb.ca/s/Linz--Austria?page=#{i+1}"
	page = Nokogiri::HTML(open(url))

max_page.times do |i|

name = []
page.css('div.h5.listing-name').each do |info|
	name << info.text.strip
end


price=[]
puts page.css('span.h3.price-amount').each do |info|
	price << info.text
end

location =[]
puts page.css('div.text-mutes.listing-location.text-truncate').each do |info|
	location << info.text.strip(/ • /)
end

CSV.open("airbnb_listing.csv", "w") do |file|
	file << ["Listing Name", "Price", "Room Type", "reviews", "Location"]
	
	name.length.times do |i|
		file << [name[i], price[i], location[i][0], location[i][1], location[i][2]]
	end
end

#puts page.css('toclevel-1').each do |vikingz|
#	puts vikingz.text
#end