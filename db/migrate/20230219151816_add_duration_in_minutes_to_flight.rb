class AddDurationInMinutesToFlight < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :duration_min, :integer
  end
end
