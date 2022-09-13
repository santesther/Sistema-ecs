class InstituicaoController < ApplicationController
  class InstituicaoController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @instituicao = Instituicao.all
    end
  
    def new
      @instituicao = Instituicao.new
    end # Here what you missing

    def show
      @instituicao = Instituicao.find(params[:id])
    end
  
    def create
      @instituicao = Instituicao.new(params[:instituicao_params])
      if @instituicao.save
  
        redirect_to instituicao_path(@instituicao)
      else
        puts "algo deu errado"
    end
  end
  
      def instituicao_params
        params.require(:instituicao).permit(:nome_da_instituicao, :cnpj,
          :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante)
      end
  end
end
