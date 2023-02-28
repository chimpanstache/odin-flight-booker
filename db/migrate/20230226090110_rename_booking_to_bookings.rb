class RenameBookingToBookings < ActiveRecord::Migration[7.0]
  def change
    # rename_table :booking, :bookings
    create_table :bookings do |t|
      t.date :expiration_date
      t.belongs_to :flight

      t.timestamps
    end
  end
end
