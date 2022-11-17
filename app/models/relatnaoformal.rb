class Relatnaoformal < ApplicationRecord
  validates :denominada_estagio, :CNPJ_estagio, :rua_estagio, :bairro_estagio, :municipio_estagio,
    :estado_estagio, :cep_estagio, :telefone_estagio, :representado_por, :ano, :semestre, :endereco,
    :numero, :bairro, :municipio, :estado, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, 
    :semestre_apresentacao, :ano_apresentacao, presence: true

    validates :periodo_de, :periodo_a, presence: false
end
