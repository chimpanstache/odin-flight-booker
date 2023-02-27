class Booking < ApplicationRecord
  has_many :passenger, class_name: 'User'
  belongs_to :flight
  has_many :informations, inverse_of: :booking
  has_many :passengers, through: :informations, foreign_key: 'passenger_id', class_name: 'User'
  accepts_nested_attributes_for :passengers
end
