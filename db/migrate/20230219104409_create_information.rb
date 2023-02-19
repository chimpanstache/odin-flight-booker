class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.references :passenger, foreign_key: {to_table: :users}
      t.belongs_to :flight

      t.timestamps
    end
  end
end
