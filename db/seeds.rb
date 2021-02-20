require 'faker'


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
number = 0
ingredients_list = open(url).read

ingredients = JSON.parse(ingredients_list)
puts "creating ingredients........."

ingredients['drinks'].each do |ingredient|
  new_ingredient = Ingredient.create!(name: ingredient['strIngredient1'])
  number += 1
  puts "#{number}. #{new_ingredient.name} created"
end

20.times do
  cocktail = Cocktail.create!(name: "#{Faker::Coffee.blend_name} #{Faker::GreekPhilodophers.name}")
  rand(1..5).times do
    Dose.create(
      cocktail: cocktail,
      ingredient: Ingredient.all.sample,
      description: Faker::ChuckNorris
    )
  end
  puts "#{cocktail.new} created"
end

review = Review.create(
  cocktail: Coctail.all.sample,
  content: Faker::Hipster.paragraph,
  rating: rand(0.00..5.99).round(1),
  user: Faker::GreekPhilodophers.name
)
puts "#{review.user} has reviewed #{review.cocktail.name}"

