class EstagioWelcomeController < ApplicationController
  def index
    @users = User.where("situacao != ?", 'Pendente').order(nome_civil: :ASC)
  
    if params[:nome_civil].present?
      @users = @users.where("lower(nome_civil) LIKE ?", "%#{params[:nome_civil].downcase}%")
    end
    if params[:licenciatura].present?
      @users = @users.where("lower(licenciatura) LIKE ?", "%#{params[:licenciatura].downcase}%")
    end
    if params[:periodo].present?
      @users = @users.where("lower(periodo) LIKE ?", "%#{params[:periodo].downcase}%")
    end
    if params[:matricula].present?
      @users = @users.where("matricula LIKE ?", "%#{params[:matricula]}%")
    end
    if params[:email].present?
      @users = @users.where("lower(email) LIKE ?", "%#{params[:email].downcase}%")
    end
  
    @will_paginate = @users.distinct.paginate(page: params[:page], per_page: 30)
  end
  

  def edit
    session[:id_user] = params['id']
    session[:nome_social] = params['nome_social']
    session[:nome_user] = params['nome_civil']
    session[:matricula_user] = params['matricula']
    session[:curso_user] = params['curso']
    session[:periodo_user] = params['periodo']
    session[:email_user] = params['email']

    @id_user = User.find(params[:id])
    
    @nome_social = @id_user.nome_social
    @nome_civil = @id_user.nome_civil

    @values_situacao = ["Revisar", "Deferido", "Indeferido"]

    @values_finalizacao = ["Revisando", "Deferido", "Indeferido"]

    @values_liberacao = ["Reprovado", "Aprovado"]
  end

  def update
    @id_user = session[:id_user]
    user = User.find(@id_user)
  
    ContactMailer.mudanca_status(user).deliver
  
    user.update(situacao_params)
  
    redirect_to estagio_welcome_index_path, notice: 'Status do usuário atualizado com sucesso!'
  end
  

  def pendente
    session[:id] = params[:id]

    ContactMailer.ingresso_estagio(current_user).deliver

    @user = current_user.update(:situacao => "Revisar")

    @user = current_user.update(:finalizacao => "Revisando")

    @user = current_user.update(:liberacao => "Reprovado")

    redirect_to estagio_welcome_index_path, notice: 'Solicitação enviada com sucesso!'
  end


  def situacao_params
    params.permit(:situacao, :finalizacao, :feedback_situacao, :liberacao)
  end

  def situacao_revisar
    params.permit(:situacao => "Revisar")
  end

  def finalizacao_revisar
    params.permit(:finalizacao => "Revisando")
  end

  def liberacao_revisar
    params.permit(:liberacao => "Reprovado")
  end

end
