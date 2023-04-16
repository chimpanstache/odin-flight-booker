# frozen_string_literal: true

FactoryBot.define do
  factory(:airport, class: 'Airport') do |_f|
    before(:create) do |airport|
      unless airport.country_id
        country = Country.last
        airport.country_id = country.id
      end
    end

    city { Faker::Address.city }
    name { Faker::Name.unique.name }
    code { [*'A'..'Z'].sample(3).join }
  end
end
