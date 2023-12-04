class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :pertence, only: [:show, :edit]

  #require './lib/generate_pdf'

  # GET /archives
  # GET /archives.json

  def index
      # Função para pesquisa do aluno
      @archives_geral = Archive.all.paginate(page: params[:page], per_page: 10)
      if params[:status].present?
        @archives_geral = @archives_geral.where('status like ?', "%#{params[:status]}%")
      end
      if params[:search_aluno].present?
        @archives_geral = @archives_geral.joins(:user).merge(User.where('lower(nome_civil) like ?', "%#{params[:search_aluno].downcase}%"))
      end
      if params[:search_periodo].present?
        @archives_geral = @archives_geral.joins(:user).merge(User.where("periodo LIKE ?", "%#{params[:search_periodo]}%"))
      end
      if params[:search_curso].present? 
        @archives_geral = @archives_geral.joins(:user).merge(User.where("licenciatura LIKE ?", "%#{params[:search_curso]}%"))
      end
  
      if params[:search_status].present? 
        @archives_geral = @archives_geral.where("archives.status = ?", "#{params[:search_status]}")
      end
  
      @archives_geral = @archives_geral.order('created_at').paginate(page: params[:page], per_page: 20)
  
      @archives_aluno = current_user.archives
  
      #respond_to do |format|
       #format.html
       #format.pdf do
         #@users = User.all
         #@archives = Archive.all
         #@user_nome = params['nome_social']
         #pdf = RelatorioPdf.new(@users, @archives, @user_nome, :margin => [50])
         #send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
       #end
      #end
  end

    # GET /archives/new
  def new
   @archive = Archive.new
    if params[:user_id]
      @user = User.find(params[:user_id])
      @archive.user_id = @user.id
      @archive.nome_usuario = @user.nome_social
    else
      @archive.user_id = current_user.id
      @archive.nome_usuario = current_user.nome_social
    end
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
    @avaliacoes = RegistroAvaliacao.where(archive_id: params[:id]).order(created_at: :DESC)
  end

   # GET /archives/1/edit
  def edit
    
  end

   # POST /archives
  # POST /archives.json
  def create
    session[:id_user] = params['id']
    session[:condicao_user] = params['condicao']
    @archive = Archive.new(archive_params)
    @archive.status = "Pendente"
    #@grupo = Grupo.where(grupo: @activity.grupo).first
    #@activity.nome_grupo = @grupo.nome_grupo

    if current_user.role != "admin"
      @archive.user_id = current_user.id
       @archive.nome_usuario = current_user.nome_social
    else
      @user = User.find(@archive.user_id)
      @archive.nome_usuario = @user.nome_social
    end

    respond_to do |format|
      if @archive.save
        if current_user.role != "admin"
          ApplicationMailer.atividade_enviada(current_user, @archive).deliver
          @users = current_user.update(:condicao => true)
        end
        format.html { redirect_to archives_new_path(:id => @archive.id), notice: 'Atividade criada com sucesso.'  }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :new }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

   # PATCH/PUT /archives/1
  # PATCH/PUT /archives/1.json
    def update
      if current_user.role == "admin"
        @archive.edited_by = current_user.nome_social
      end
  
      respond_to do |format|
        if @archive.update(archive_params)
  
          # Achar o grupo da tabela Grupo
          #@grupo = Grupo.find_by(grupo: @archive.grupo)
  
          # Atualizar o nome_grupo da tabela Activity pelo dado resgatado da tabela Grupo
          #@atualizar_nome_grupo = @archive.update(nome_grupo: @grupo.nome_grupo)
  
          # Encontrar usuário para mandar o email de aviso de avaliação da AACC para o mesmo.
          @aluno_da_atividade = User.find_by(nome_social: @archive.nome_usuario)
  
          if current_user.role != "admin"
           ApplicationMailer.atividade_editada(current_user, @archive).deliver
          else
            @id = @aluno_da_atividade.id
            @nome_social = @archive.nome_usuario
            @status = @archive.status
  
            @registro = RegistroAvaliacao.create!(aluno_id: @id, nome_aluno: @nome_social, status: @status, avaliador: current_user.nome_social, archive_id: @archive.id, responsavel_avaliacao_id: current_user.id)
            ApplicationMailer.atividade_avaliada(current_user, @archive, @aluno_da_atividade).deliver
          end
  
          format.html { redirect_to @archive, notice: 'Atividade atualizada com sucesso.' }
          format.json { render :show, status: :ok, location: @archive }
        else
          format.html { render :edit }
          format.json { render json: @archive.errors, status: :unprocessable_entity }
        end
      end
    end

    def pertence
      if ((current_user.role != "admin")&&(current_user.id != @archive.user_id))
        flash[:notice] = "Essa atividade não está acessível para você"
        redirect_to archives_url
      end
    end


  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to archives_url, notice: 'Atividade excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      params.require(:archive).permit(:status ,:user_id, :documents, :condicao)
    end

end
