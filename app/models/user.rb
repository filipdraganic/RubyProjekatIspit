class User < ApplicationRecord
  include Clearance::User

  has_many :posts
  has_and_belongs_to_many :dokuments
  has_many :primedbas
  has_many :izmenas

end
