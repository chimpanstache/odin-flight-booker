class AddReferencesToBookingAndPassengerOnInformation < ActiveRecord::Migration[7.0]
  def change
    add_reference :informations, :passenger, foreign_key: {to_table: :users}
    add_reference :informations, :booking, foreign_key: true
  end
end
