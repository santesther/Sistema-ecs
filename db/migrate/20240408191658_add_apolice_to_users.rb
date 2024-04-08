class AddApoliceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :apolice, :string
  end
end
