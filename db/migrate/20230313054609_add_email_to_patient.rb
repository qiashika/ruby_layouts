class AddEmailToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :email_id, :string
  end
end