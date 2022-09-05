  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show]
  
  
    def index
      @users = User.all.order(nome_social: :ASC).paginate(page: params[:page], per_page: 30)
      if params[:nome_social].present?
        @users = @users.where("lower(nome_social) LIKE ?", "%#{params[:nome_social].downcase}%").order(nome_social: :ASC).paginate(page: params[:page], per_page: 30)
      end
      if params[:licenciatura].present?
        @users = @users.where("lower(licenciatura) LIKE ?", "%#{params[:licenciatura].downcase}%").order(nome: :ASC).paginate(page: params[:page], per_page: 30)
      end
      if params[:periodo].present?
        @users = @users.where("lower(periodo) LIKE ?", "%#{params[:periodo].downcase}%").order(nome: :ASC).paginate(page: params[:page], per_page: 30)
      end
      if params[:matricula].present?
        @users = @users.where("matricula LIKE ?", "%#{params[:matricula]}%").order(nome: :ASC).paginate(page: params[:page], per_page: 30)
      end
    end
  
    def show
    #   @atividades_deferidas = Activity.where(user_id: params[:id], status: "Deferido") 
    #   @atividades_indeferidas = Activity.where(user_id: params[:id], status: "Indeferido") 
    #   @atividades_pendentes = Activity.where(user_id: params[:id], status: "Pendente") 
    #   @atividades_revisar = Activity.where(user_id: params[:id], status: "Revisar") 
    end
  
    def set_user
      @user = User.find(params[:id])
    end
    end
