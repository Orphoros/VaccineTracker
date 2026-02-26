class CreateVaccinations < ActiveRecord::Migration[8.1]
  def change
    create_table :vaccinations do |t|
      t.date :received_at, null: false

      t.timestamps
    end
  end
end
