class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :patient_name, null: false
      t.text :phone_number, null: false
      t.timestamps
    end
  end
end
