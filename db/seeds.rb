require 'open-uri'
#create admin
Admin.create!(email: "bagiotto@brothers.com", password: "BbrothersPub", password_confirmation: "BbrothersPub")

categories = ["Piatto", "Bevanda"]
p "Initialized category: #{categories}"
categories.each do |category|
  Category.create!(name: category) unless Category.find_by(name: category)
end

tags_piatti = ["Tutti","Stuzzicheria","Hamburger","Hot Dog","Ciabattine","Piadine","Crostoni","Pagnotte","Pucce","Terrine","Carpaccio","Tartare e Tataki","Carne","Insalate","Taglieri","Aperitivo"]
tags_drinks = ["Tutti","Drinks","Birre alla spina","Birre in bottiglia"]

tags_piatti.each do |tag|
  Tag.create(name: tag, category_id: 1)
end
tags_drinks.each do |tag|
  Tag.create(name: tag, category_id: 2)
end

p "Initialized ingredients"
url = "http://nut.entecra.it/646/tabelle_di_composizione_degli_alimenti.html?alimento=&nutriente=tutti&categoria=tutte&quant=100"
page = Nokogiri::HTML(open(url))
page.css('div a').each do |a|
  if (a.attributes&.size == 2 && a.child&.is_a?(Nokogiri::XML::Text) && a.attributes.keys.include?("href") && a.attributes.keys.include?("title") && a.attributes.keys.size == 2 && a.attributes["href"].value.include?("idalimento"))
    food_name = a["title"].strip.split("[")[0]
    i = nil
    i = Ingredient.create!(name: food_name) unless Ingredient.find_by(name: food_name)
    puts "create #{i.name}" unless i.nil?
  end
end
