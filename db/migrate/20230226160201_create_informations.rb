class CreateInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :informations do |t|
      t.references :passenger, foreign_key: {to_table: :user}
      t.belongs_to :booking

      t.timestamps
    end
  end
end
