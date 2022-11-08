class AddNomeSocialToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nome_social, :string
  end
end
