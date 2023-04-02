class ChangeCountryColumnOnAirportTable < ActiveRecord::Migration[7.0]
  def change
    change_column :airports, :country, :integer
  end
end
