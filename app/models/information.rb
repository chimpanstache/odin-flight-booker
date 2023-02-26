class Information < ApplicationRecord
  self.table_name = "informations"
  belongs_to :booking
  belongs_to :passenger, class_name: 'User', foreign_key: 'passenger_id'
end
