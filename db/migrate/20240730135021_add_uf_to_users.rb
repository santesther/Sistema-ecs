class AddUfToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uf, :string
  end
end
