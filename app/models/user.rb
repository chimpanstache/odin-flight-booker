class User < ApplicationRecord
  has_many :informations, inverse_of: :user
  has_many :bookings, through: :informations
end
