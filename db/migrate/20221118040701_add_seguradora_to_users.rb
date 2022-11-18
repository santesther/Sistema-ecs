class AddSeguradoraToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :seguradora, :string
  end
end
