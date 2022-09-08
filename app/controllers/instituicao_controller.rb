class InstituicaoController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @instituicao = Instituicao.find(params[:id])
  end

  def new
    @instituicao = Instituicao.new
  end # Here what you missing

  def create
    @instituicao = Instituicao.new(params[:instituicao_params])
    if @instituicao.save
      flash[:success] = "Você cadastrou sua instituição!"
      redirect_to welcome_path #pretendo redirecionar para a visualização do documento de estágio, aí pra acessar o usuario tem que ser validado pela dirlic.
    # else
    #   redirect_to welcome_path
    end
  end

    def instituicao_params
      params.require(:instituicao).permit(:nome_da_instituicao, :cnpj,
        :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante)
    end
end
