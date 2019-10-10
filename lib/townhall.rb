require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email_array = []

#if contains @ > mail & if contains "adresse mairie de... > ville
	email = page.xpath('//*[contains(text(), "@")]').text
	town = page.xpath('//*[contains(text(), "Adresse mairie de")]').text.split

	email_array << {town[3] => email}#nom de la ville en 3 eme ds la string
	puts email_array
	return email_array
end

def get_urls
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	url_array = []

	urls = page.xpath('//*[@class="lientxt"]/@href') 

	urls.each do |url| #link nom de la ville a son url correspondante
		url = "http://annuaire-des-mairies.com" + url.text[1..-1] #need 2nd to last info 
		url_array << url		
	end
	return url_array 
end

 #recup chaque Nom de ville avec l'adresse de sa mairie 
#Need condition if get_email vide
def go
puts " Scrapping en cours, veuillez patienter..."
	url_array = get_urls 
	url_array.each do |get_url| #link chaque ville à son url
 get_email(get_url) #recherche l'adresse mail par rapport à l'adresse de la ville
end
end

#go
