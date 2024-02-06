class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  
  def index
    @users = User.all.order(nome_civil: :ASC).paginate(page: params[:page], per_page: 30)
    if params[:nome_civil].present?
      @users = @users.where("lower(nome_civil) LIKE ?", "%#{params[:nome_civil].downcase}%").order(nome_civil: :ASC).paginate(page: params[:page], per_page: 30)
    end
    if params[:licenciatura].present?
      @users = @users.where("lower(licenciatura) LIKE ?", "%#{params[:licenciatura].downcase}%").order(nome_civil: :ASC).paginate(page: params[:page], per_page: 30)
    end
    if params[:periodo].present?
      @users = @users.where("lower(periodo) LIKE ?", "%#{params[:periodo].downcase}%").order(nome_civil: :ASC).paginate(page: params[:page], per_page: 30)
    end
    if params[:matricula].present?
      @users = @users.where("matricula LIKE ?", "%#{params[:matricula]}%").order(nome_civil: :ASC).paginate(page: params[:page], per_page: 30)
    end
    if params[:finalizacao].present?
      @users = @users.where("finalizacao LIKE ?", "%#{params[:finalizacao]}%").order(nome_civil: :ASC).paginate(page: params[:page], per_page: 30)
  end
end

  def new
    @user = User.new(user_params)
  end

  def update_status
    @user = User.find(params[:id])
    if params[:status].present? && User::STATUS.include?(params[:status].to_sym)
    @user.update(status: params[:status])
    redirect_to users_path
    else
      redirect_to users_path, alert: "Nao foi possível trocar o status" 	
    end
  end

  def liberar
    @user = User.find(params[:id])

    if @user.pdf_centro == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_centro)
    if @relatorios.present?
      @relatorios.destroy_by(params[:id])
    end
    end
    if @user.pdf_campi == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_campi)
    end
    if @user.pdf_publico == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_publico)
    end
    if @user.pdf_particular == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_particular)
    end
    if @user.pdf_aditivo_centro == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_aditivo_centro)
    end
    if @user.pdf_aditivo_campi == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_aditivo_campi)
    end
    if @user.pdf_aditivo_estadual == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_aditivo_estadual)
    end
    if @user.pdf_aditivo_municipalouparticular == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_aditivo_municipalouparticular)
    end
    if @user.pdf_naoformal == true && @user.liberacao == "Aprovado"
    @user.toggle!(:pdf_naoformal)
    end
    if @user.status_impressao == true && @user.liberacao == "Aprovado"
    @user.toggle!(:status_impressao)
    end
    if @user.condicao == true && @user.liberacao == "Aprovado"
    @user.toggle!(:condicao)
    end

    if @user.liberacao == "Aprovado"
    @user.update(:situacao => "Pendente")
    end
    @user.update(:finalizacao => "Revisando")

    if @relatorio.present? == false
    if @user.save && @user.liberacao == "Aprovado" 
      redirect_to estagio_welcome_index_path, notice: 'O usuário está apto a preencher outro Termo!' 
   else
      redirect_to estagio_welcome_index_path, alert: 'Não foi possível efetuar a liberação do usuário! Lembre-se que o usuário precisa estar liberado e ter seu termo deletado!'
   end
  end
end


  def show
  
  end

  def set_user
    @user = User.find(params[:id])
  end

  private 

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_params
    params.require(:user).permit(:nome_civil, :nome_social, :email, :endereco, :complemento, :numero, :bairro, :municipio, :cep, :matricula, :licenciatura, :periodo, :telefone, :avatar, :nome_da_instituicao, :tipo_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :arquivos, :feedback_situacao)
  end
  
  end