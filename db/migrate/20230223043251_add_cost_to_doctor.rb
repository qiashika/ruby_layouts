class AddCostToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :cost, :integer
  end
end
