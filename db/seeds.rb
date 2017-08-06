# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def range (min, max)
    rand * (max-min) + min
end

puts "Running db:seed"

if Section.count == 0
  puts "No sections! Let's create some"
  ["Breakfast", "Brunch", "Lunch", "Dinner"].each do |name|
    section = Section.create(name: name)
    if section.persisted?
      puts "Saved section with name = #{name}"
    end

  end
else
  puts "Looks like you already have some sections!"
end

puts "Generating Dishes"

sections = Section.all

20.times do
  FoodItem.create(
    name: Faker::Food.dish,
    section: sections.sample,
    price: range(10, 30).round(2)
  )
end