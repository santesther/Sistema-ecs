class AddEstadoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :estado, :string
  end
end
