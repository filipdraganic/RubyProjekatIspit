class Tranzakcija < ApplicationRecord
  belongs_to :user
  has_one :dokument
end
