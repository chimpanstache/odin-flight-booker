class Country < ApplicationRecord
  has_many :airports, class_name: 'Airport', foreign_key: 'country_id', dependent: :destroy
end
