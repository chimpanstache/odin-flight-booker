class RenameBookingToBookings < ActiveRecord::Migration[7.0]
  def change
    rename_table :booking, :bookings
  end
end
