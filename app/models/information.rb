class Information < ApplicationRecord
  belongs_to :passenger, class_name: 'User'
  belongs_to :flight
end
