class AddMatriculaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :matricula, :string
  end
end
