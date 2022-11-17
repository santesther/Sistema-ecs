class Relatorio < ApplicationRecord
    validates :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, 
    :semestre_apresentacao, :ano_apresentacao, :matricula_aluno, :aluno_semestre, :ano, :endereco, :numero, 
    :complemento, :bairro, :municipio, :estado, :cep, :telefone, :estado_da_instituicao, 
    :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, 
    :cep_da_instituicao, :telefone_da_instituicao, :representante, presence: true

    validates :periodo_de, :periodo_a, presence: false
end
