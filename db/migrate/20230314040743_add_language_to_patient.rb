class AddLanguageToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :language, :string
  end
end
