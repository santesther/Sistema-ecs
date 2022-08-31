class AddLicenciaturaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :licenciatura, :string
  end
end
