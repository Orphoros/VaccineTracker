class CreateVaccines < ActiveRecord::Migration[8.1]
  def change
    create_table :vaccines do |t|
      t.string :name, null: false
      t.float :dose, null: false
      t.string :brand, null: false
      t.string :batch_number, null: false
      t.boolean :is_booster, null: false
      t.integer :days_valid, null: false

      t.references :vaccination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
