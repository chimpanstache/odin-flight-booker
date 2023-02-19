class CreateBillings < ActiveRecord::Migration[7.0]
  def change
    create_table :billings do |t|
      t.integer :last_4_digits
      t.integer :cvc
      t.date :expiration_date

      t.timestamps
    end
  end
end
