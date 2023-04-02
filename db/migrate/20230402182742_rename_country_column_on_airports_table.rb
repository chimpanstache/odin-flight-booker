class RenameCountryColumnOnAirportsTable < ActiveRecord::Migration[7.0]
  def change
    change_table :airports do |t|
      t.rename :country, :country_id
    end
  end
end
