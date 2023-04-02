class AddForeignKeyOnCountryIdOnAirportsTable < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :airports, :countries, column: :country_id
  end
end
