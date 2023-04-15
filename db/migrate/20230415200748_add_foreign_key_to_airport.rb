class AddForeignKeyToAirport < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :airports, :countries, column: :country_id
    add_index :airports, :country_id
  end
end
