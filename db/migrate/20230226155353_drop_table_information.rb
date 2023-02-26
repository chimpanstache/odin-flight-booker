class DropTableInformation < ActiveRecord::Migration[7.0]
  def change
    drop_table :information
  end
end
