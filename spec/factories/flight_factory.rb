# frozen_string_literal: true

FactoryBot.define do
  factory(:flight, class: 'Flight') do |_f|
    before(:create) do |flight|
      unless flight.departure_id
        departure_airport = create(:airport)
        flight.departure_id = departure_airport.id
      end
      unless flight.arrival_id
        arrival_airport = create(:airport)
        flight.arrival_id = arrival_airport.id
      end
    end

    time { Time.now }
    passenger_count { rand(1..50) }
    max_passenger { rand(60..100) }
    duration_min { rand(60..300) }
  end
end
