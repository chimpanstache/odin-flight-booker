class Flight < ApplicationRecord
  belongs_to :departure, class_name: 'Airport', foreign_key: 'departure_id'
  belongs_to :arrival, class_name: 'Airport', foreign_key: 'arrival_id'
  has_many :billings, inverse_of: :flight

  scope :research, ->(departure_id, arrival_id, date) {
    where(departure_id: departure_id, arrival_id: arrival_id, time: date)
  } 
end
