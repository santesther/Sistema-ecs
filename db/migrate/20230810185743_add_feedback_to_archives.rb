class AddFeedbackToArchives < ActiveRecord::Migration[7.0]
  def change
    add_column :archives, :feedback, :text
  end
end
