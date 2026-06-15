class Hero < ApplicationRecord
  validates :name, presence: true
#scope método de consulta que retorna um ActiveRecord::Relation
  scope :sort_by_name, -> {order(:name)}
  #Dessa forma o ruby impede uma futura injeção por SQL
  # O método scope recebe dois parâmetros como argumento, o nome do método e uma função lambda
  scope :search_by_name, -> (term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
end