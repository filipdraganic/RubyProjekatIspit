class Dokument < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :tranzakcijas
  has_many :primedbas
  has_many :izmenas
end
