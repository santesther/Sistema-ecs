class AddNomeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nome, :string
  end
end
