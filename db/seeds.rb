# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Exchange.destroy_all

e = Exchange.create(name: 'Office', date: Time.now + (2*7*24*60*60), status: 0)


20.times do
  p = Person.new(name: Faker::Name.first_name, key: '1234', exchange: e)
  5.times do
    Gift.create(name:Faker::Hipster.word, person: p)
  end
  p.save
end
