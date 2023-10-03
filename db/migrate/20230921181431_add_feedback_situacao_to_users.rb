class AddFeedbackSituacaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :feedback_situacao, :string
  end
end
