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
  
    def new
      @user = User.new
      @user.build_instituicao
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

    private 

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_params
      params.require(:user).permit(:nome_civil, :nome_social, :email, :endereco, :complemento, :numero, :bairro, :municipio, :cep, :matricula, :licenciatura, :periodo, :telefone, :avatar, :instituicao_attributes => [:nome_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :user_id])
    end
    
    end
