class AddNomeCivilToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nome_civil, :string
  end
end
