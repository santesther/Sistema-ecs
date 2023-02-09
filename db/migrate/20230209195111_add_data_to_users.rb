class AddDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :data, :string
  end
end
