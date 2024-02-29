class MensagensController < ApplicationController
    before_action :set_mensagem, only: [:show]
    before_action :authenticate_user!
    # GET /mensagens
    # GET /mensagens.json
    def index
      @mensagens = Mensagem.where(destinatario_id: params[:user_id]).paginate(page: params[:page])
    end
  
    # GET /mensagens/1
    # GET /mensagens/1.json
    def show
    session[:nome_user] = params['nome_civil']
    end
  
    # GET /mensagens/new
    def new
      @mensagem = Mensagem.new
      @aluno = User.find(params[:user_id])
      @mensagem.destinatario_id = @aluno.id
    end
  
    # POST /mensagens
    # POST /mensagens.json
    def create
      @mensagem = Mensagem.new(mensagem_params)
      @mensagem.remetente_id = current_user.id
  
      respond_to do |format|
        if @mensagem.save
          format.html { redirect_to @mensagem, notice: 'Mensagem enviada com sucesso!' }
          format.json { render :show, status: :created, location: @mensagem }
          #ApplicationMailer.mensagem_enviada(@mensagem).deliver
        else
          format.html { render :new }
          format.json { render json: @mensagem.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_mensagem
        @mensagem = Mensagem.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def mensagem_params
        params.require(:mensagem).permit(:texto, :remetente_id, :destinatario_id)
      end
  end