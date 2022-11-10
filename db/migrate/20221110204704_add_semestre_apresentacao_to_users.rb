class AddSemestreApresentacaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :semestre_apresentacao, :string
  end
end
