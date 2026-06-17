class HeroSerializer < ActiveModel::Serializer
    attributes :id, :name, :power, :age, :city
end
