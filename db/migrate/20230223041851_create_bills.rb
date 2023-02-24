class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :payment_type
      t.string :payment_status

      t.timestamps
    end
  end
end
