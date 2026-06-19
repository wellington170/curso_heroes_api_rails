FactoryBot.define do 
    factory :hero do
        name {Faker::Superhero.name}
        token {Faker::Alphanumeric.alpha(number: 10)}
        age {rand(18..80)}
        city {Faker::Address.city}
        power {Faker::Superhero.power}
        
    factory :invalid_hero do
        name { nil }
    end
    end



end