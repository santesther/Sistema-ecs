class InstituicaoController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @instituicao = Instituicao.new
  end
  
  def show
     @instituicao = Instituicao.find.where(user_id: current_user.id)
  end

  def new
    @instituicao = Instituicao.new
  end # Here what you missing

  def create
    @instituicao = Instituicao.new(params[:instituicao_params])
    if @instituicao.save
      redirect_to welcome_path
    else
      puts "algo deu errado"
    end
  end

    def instituicao_params
      params.require(:instituicao).permit(:nome_da_instituicao, :cnpj,
        :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante)
    end
end
