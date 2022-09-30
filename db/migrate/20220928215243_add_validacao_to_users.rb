class AddValidacaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :validacao, :boolean
  end
end
