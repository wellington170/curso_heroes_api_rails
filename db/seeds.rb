Hero.delete_all

10.times do |i|
    Hero.create(name: Faker::Superhero.name, age: rand(18..80), city: Faker::Address.city,  power: Faker::Superhero.power, token: "wwwwwwwwwaaaaaaaw")
end