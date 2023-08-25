class RegistroAvaliacao < ApplicationRecord
    belongs_to :aluno, class_name: "User"
	belongs_to :archive, class_name: "Archive"
	belongs_to :responsavel_avaliacao, class_name: "User"

    validates :aluno_id, :archive_id, :responsavel_avaliacao_id, :status, presence: true
end
