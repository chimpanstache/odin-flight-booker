class Airport < ApplicationRecord
  belongs_to :countries, class_name: 'Country', foreign_key: 'country_id'
  has_many :arrivals, foreign_key: 'arrival_id', class_name: 'Flight'
  has_many :departures, foreign_key: 'departure_id', class_name: 'Flight'
end
