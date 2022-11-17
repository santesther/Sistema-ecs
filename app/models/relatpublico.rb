class Relatpublico < ApplicationRecord
    validates :parceria_firmada_com, :denominada_estagio, :CNPJ_estagio, :rua_estagio, :numero_estagio, 
    :periodo_letivo, :bairro_estagio, :municipio_estagio, :telefone_estagio, :representado_por, :ano, 
    :semestre, :endereco, :bairro, :municipio, :estado, :cep, :instituicao_apresentacao, :aluno_apresentacao, 
    :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :aluno_semestre, :estado_da_instituicao, presence: true

    validates :periodo_de, :periodo_a, :reitor, presence: false
end
