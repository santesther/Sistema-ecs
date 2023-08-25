class AddCondicaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :condicao, :boolean
  end
end
