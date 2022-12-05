class EstagioWelcomeController < ApplicationController
  def index
    @users = User.order(nome_social: :ASC).where("situacao != '0' AND (nome_social LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search OR periodo LIKE :search OR email LIKE :search)", search: "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    if @users.exists?
    else
      @users = User.order(nome_social: :ASC).where("situacao != '0' AND (nome_social LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search OR periodo LIKE :search OR email LIKE :search)", search: "%#{params[:search]}%".titleize).paginate(page: params[:page], per_page: 10)
      if @users.exists?
      else
        @users = User.order(nome_social: :ASC).where("situacao != '0' AND (nome_social LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search OR periodo LIKE :search OR email LIKE :search)", search: "%#{params[:search]}%".titleize).paginate(page: params[:page], per_page: 10)
      end
    end

    @will_paginate = User.where("situacao != '0'").order(nome_social: :ASC).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @relatorios = Relatparticular.all
    @relatorios = Relatorio.all
    @relatorios = Relatpublico.all
    @relatorios = Relatnaoformal.all

    session[:id_user] = params['id']
    session[:nome_user] = params['nome_social']
    session[:matricula_user] = params['matricula']
    session[:curso_user] = params['curso']
    session[:periodo_user] = params['periodo']
    session[:email_user] = params['email']

    @id_user = User.find(params[:id])
    

    @values_situacao = ["Revisar", "Aprovado", "Reprovado"]

    @values_finalizacao = ["Revisando", "Finalizado", "Negado"]
  end

  def update
    @id_user = session[:id_user]

    ContactMailer.mudanca_status(current_user).deliver

    User.where(id: @id_user).update(situacao_params)

    redirect_to estagio_welcome_index_path, notice: 'Usuário atualizado com sucesso!'
  end

  def pendente
    session[:id] = params[:id]

    @user = current_user.update(:situacao => "Revisar")

    @user = current_user.update(:finalizacao => "Revisando")

    redirect_to estagio_welcome_index_path, notice: 'Solicitação enviada com sucesso!'
  end

  def situacao_params
    params.permit(:situacao, :finalizacao)
  end

  def situacao_revisar
    params.permit(:situacao => "Revisar")
  end

  def finalizacao_revisar
    params.permit(:finalizacao => "Revisando")
  end

end
