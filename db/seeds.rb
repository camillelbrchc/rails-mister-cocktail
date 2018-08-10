# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all


puts "Create ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

mojito = Cocktail.create!(name: "Mojito")
cosmopolitain = Cocktail.create!(name: "Cosmopolitain")
gin_tonic = Cocktail.create!(name: "Gin Tonic")

# Dose.create!(description: "6cl", cocktail: mojito, ingredient: lemon)
# Dose.create!(description: "4cl", cocktail: cosmopolitain, ingredient: cramberry)
# Dose.create!(description: "2cl", cocktail: gin_tonic, ingredient: cucumber)
