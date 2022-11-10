class AddAnoApresentacaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ano_apresentacao, :string
  end
end
