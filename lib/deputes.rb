require 'open-uri'
require 'nokogiri'

def get_link
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  page.xpath('//div[@id="deputes-list"]//@href').map do |i|
    "http://www2.assemblee-nationale.fr" + i.text #add noms a lurl
  end
end

def go(deputes_urls_array)
puts "Scrapping en cours, veuillez patienter..."
puts "L'opération peut prendre jusqu'à 3 minutes, soyez patients :) "
  deputes_full_array = Array.new #array vide a return
  deputes_urls_array.each do |url|
    page = Nokogiri::HTML(open(url))
    depute_first_name = page.xpath('//div[@class="titre-bandeau-bleu clearfix"]//h1').text.split[1]# prenom en position 1
    depute_last_name = page.xpath('//div[@class="titre-bandeau-bleu clearfix"]//h1').text.split[2]#nom en position 2
    depute_email = page.xpath('//a[@class="email"]')[1].text #1 email
    deputes_full_array << { "first_name" => depute_first_name, "last_name" => depute_last_name, "email" => depute_email }
  end #new array qui prend prénom, nom, mail 
  deputes_full_array 
end

puts go(get_link)
