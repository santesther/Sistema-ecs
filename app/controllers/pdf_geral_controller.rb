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
      @relatorios = Relatcampi.all
  
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
      @relatorios = Relatcampi.where("matricula_aluno = '"+ session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_campi_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def update_naoformal
      @relatorios = Relatnaoformal.where("matricula_aluno = '"+ session[:matricula_aluno]+"' AND aluno_apresentacao = '"+ session[:nome_aluno]+"'").update(relatorio_naoformal_params)
      redirect_to estagio_welcome_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def relatorio_particular_params
    params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :estado_da_instituicao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador)
    end
  
    def relatorio_publico_params
      params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :reitor, :estado_da_instituicao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador)
    end
  
    def relatorio_centro_params
      params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador)
    end
  
    def relatorio_campi_params
      params.permit(:data, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :estado_da_instituicao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador)
    end
  
    def relatorio_naoformal_params
      params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :representante_da_instituicao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :instituicao_apresentacao_dois, :estado_da_instituicao, :aluno_apresentacao_tres, :aluno_periodo, :ano, :aluno_semestre, :estado, :periodo_de, :periodo_a, :avaliador)
    end
  end
  
