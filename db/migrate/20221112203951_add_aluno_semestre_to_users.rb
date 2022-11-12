class AddAlunoSemestreToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :aluno_semestre, :string
  end
end
