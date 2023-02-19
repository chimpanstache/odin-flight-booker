class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :time
      t.int :passenger_count
      t.int :max_passenger
      t.timestamps
    end
  end
end
