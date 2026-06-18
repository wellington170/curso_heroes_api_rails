class Hero < ApplicationRecord

  validates :name, presence: true, uniqueness: { scope: :token, case_sensitive: false}
  validates :power, :age, :city, presence: false
  validates :token, presence: true, length: {minimum: 10}

#scope método de consulta que retorna um ActiveRecord::Relation
  scope :by_token, -> (token) {where(token: token)}
  scope :sort_by_name, -> {order(:name)}
  #Dessa forma o ruby impede uma futura injeção por SQL
  # O método scope recebe dois parâmetros como argumento, o nome do método e uma função lambda
  scope :search_by_name, -> (name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
end