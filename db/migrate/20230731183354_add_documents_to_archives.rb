class AddDocumentsToArchives < ActiveRecord::Migration[7.0]
  def change
    add_column :archives, :documents, :json
  end
end
