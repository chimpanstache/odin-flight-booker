class CreateCountries < ActiveRecord::Migration[7.0]
  
  #taken from https://github.com/mm1/country-list/blob/master/migration_create_countries.rb
  def change
    create_table :countries do |t|
      t.column :name, :string, size: 100
      t.column :iso2, :string, size: 2
      t.column :iso3, :string, size: 3
      t.column :numcode, :integer

      t.timestamps
    end
  end
end
