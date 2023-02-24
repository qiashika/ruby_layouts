class AddRefToBill < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :doctor, foreign_key: true
    add_reference :bills, :patient, foreign_key: true

  end
end
