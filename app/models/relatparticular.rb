class Relatparticular < ApplicationRecord
    validates :representado_por, :periodo, :semestre, :ano, :endereco, :bairro, :municipio, 
    :estado, :cep, :cnpj, :instituicao_apresentacao, :aluno_apresentacao, 
    :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :aluno_semestre, :estado_da_instituicao, presence: true

    validates :periodo_de, :periodo_a, presence: false
end
