class AddSemestreToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :semestre, :integer
  end
end
