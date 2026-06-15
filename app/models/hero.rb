class Hero < ApplicationRecord
  validates :name, presence: true
#scope método de consulta que retorna um ActiveRecord::Relation
  scope :sort_by_name, -> {order(:name)}
end