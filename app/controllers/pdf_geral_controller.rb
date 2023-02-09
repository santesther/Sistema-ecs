class PdfGeralController < ApplicationController

    def particular
      @relatorios = Relatparticular.all
  
      @users = User.find(params[:id])
  
      session[:matricula_aluno] = @users.matricula
      session[:nome_aluno] = @users.nome_social
    end
  
    def publico
      @relatorios = Relatpublico.all
  
      @users = User.find(params[:id])
  
      session[:matricula_aluno] = @users.matricula
      session[:nome_aluno] = @users.nome_social
    end
  
    def centro
      @relatorios = Relatorio.all
  
      @users = User.find(params[:id])
  
      session[:matricula_aluno] = @users.matricula
      session[:nome_aluno] = @users.nome_social
    end
  
    def campi
      @relatorios = Relatorio.all
  
      @users = User.find(params[:id])
  
      session[:matricula_aluno] = @users.matricula
      session[:nome_aluno] = @users.nome_social
    end
  
    def naoformal
      @relatorios = Relatnaoformal.all
  
      @users = User.find(params[:id])
  
      session[:matricula_aluno] = @users.matricula
      session[:nome_aluno] = @users.nome_social
    end
  
    def update_particular
      @relatorios = Relatparticular.where("matricula_aluno = '"+ session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_particular_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def update_publico
      @relatorios = Relatpublico.where("matricula_aluno = '"+session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_publico_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def update_centro
      @relatorios = Relatorio.where("matricula_aluno = '"+ session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_centro_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def update_campi
      @relatorios = Relatorio.where("matricula_aluno = '"+ session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_campi_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def update_naoformal
      @relatorios = Relatnaoformal.where("matricula_aluno = '"+ session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_naoformal_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def relatorio_particular_params
    params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :estado_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :numero, :aluno_semestre, :ano, :endereco, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :matricula_aluno, :aluno_periodo, :representante_da_instituicao, :seguradora, :apolice, :data)
    end
  
    def relatorio_publico_params
      params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :reitor, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :estado_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :numero, :aluno_semestre, :ano, :endereco, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :matricula_aluno, :apolice, :seguradora, :data)
    end
  
    def relatorio_centro_params
      params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :matricula_aluno, :aluno_semestre, :ano, :endereco, :numero, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :estado_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :apolice, :seguradora, :data)
    end
  
    def relatorio_campi_params
      params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :estado_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :numero, :aluno_semestre, :ano, :endereco, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :apolice, :seguradora, :data)
    end
  
    def relatorio_naoformal_params
      params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :estado_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :numero, :aluno_semestre, :ano, :endereco, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :matricula_aluno, :aluno_periodo, :representante_da_instituicao, :seguradora, :apolice, :data)
    end
  end
  
