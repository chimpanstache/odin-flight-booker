class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :time
      t.integer :passenger_count
      t.integer :max_passenger
      t.timestamps
      t.references :departure, foreign_key: {to_table: :airports}
      t.references :arrival, foreign_key: {to_table: :airports}
    end
  end
end
