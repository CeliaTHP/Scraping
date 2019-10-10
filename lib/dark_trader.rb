
require 'nokogiri'
require 'open-uri'

def nokopage
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  return page
end

def get_name
  array_name = []
  page = nokopage
  page.xpath('//*[@id]/td[3]').each {|i| array_name << i.text}
  return array_name
end


def get_price
  array_price = []
  page = nokopage
  page.xpath('//*[@id]/td[5]/a').each {|i| array_price << i.text[1..-1]}
  return array_price
end

def full_infos

puts "Scrapping en cours, veuillez patientez... "
  i = 0
  name = get_name
  price = get_price
  full_array = []
  hash = {}

  name.length.times do |i|
    infos = {name[i] => price[i].to_f}
    full_array << infos

end
return full_array
end

def go
puts full_infos
end

go
