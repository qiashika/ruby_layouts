class CreateChambers < ActiveRecord::Migration[7.0]
  def change
    create_table :chambers do |t|
      t.string :name
      t.text :address
      t.timestamps
    end

    create_table :chambers_doctors, id: false do |t|
      t.belongs_to :doctor
      t.belongs_to :chamber
    end
  end
end
