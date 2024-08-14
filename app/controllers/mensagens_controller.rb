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
          ApplicationMailer.mensagem_enviada(@mensagem).deliver
        else
          format.html { render :new }
          format.json { render json: @mensagem.errors, status: :unprocessable_entity }
        end
      end
    end

    def enviadas
      if params[:nome_search].present? || params[:matricula_search].present?
        query = User.all
        query = query.where('nome_civil LIKE ?', "%#{params[:nome_search]}%") if params[:nome_search].present?
        query = query.where('matricula LIKE ?', "%#{params[:matricula_search]}%") if params[:matricula_search].present?
    
        user_ids = query.pluck(:id)
    
        @mensagens_enviadas = Mensagem.where(destinatario_id: user_ids).order(created_at: :desc).paginate(page: params[:page])
      else
        @mensagens_enviadas = Mensagem.order(created_at: :desc).paginate(page: params[:page])
      end
    end
    
  

    private
      def set_mensagem
        @mensagem = Mensagem.find(params[:id])
      end
  
      def mensagem_params
        params.require(:mensagem).permit(:texto, :remetente_id, :destinatario_id)
      end
  end