class RelatorioPublicoController < ApplicationController
  def index
    @relatorios = Relatpublico.all
  
    if current_user.licenciatura == 'Ciências da Natureza'
      return redirect_to action: "edit"
    end
  
    respond_to do |format|
      format.html
      format.pdf do
        @relatorio = Relatpublico.all
  
        @usuario_matricula = current_user.role != "normal_user" ? params['matricula'] : current_user.matricula
        current_user.update(status_impressao: true)
        pdf = PublicosPdf.new(@relatorio, current_user, @usuario_matricula)
        send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
  
        ContactMailer.confirmacao_impressao(current_user).deliver if current_user.role == "normal_user"
      end
    end
  end
  
    def avaliador
      @relatpublico.avaliador.build
    end
  
  
    def update
      @relatorios = current_user.update(user_params)
      redirect_to relatorio_publico_index_path, notice: 'Dados Atualizados com sucesso!'
    end
  
    def destroy
      Rails.logger.info("Parâmetro user_id recebido: #{params[:user_id]}")
      @relatorio_publico = Relatpublico.find_by(user_id: params[:user_id])
      if @relatorio_publico
        Rails.logger.info("Encontrou a carta de apresentação com ID: #{@relatorio_publico.id}")
        @relatorio_publico.destroy
        flash[:notice] = "Termo de Instituição Publica excluído com sucesso."
      else
        Rails.logger.info("Relatorio aditivo centro não encontrada para user_id: #{params[:user_id]}")
        flash[:alert] = "Termo de Instituição Pública não encontrado."
      end
      redirect_to estagio_welcome_index_path
    end
  
    def create
      @relatorios = Relatpublico.new(relatorio_params)
  
      @users = current_user.update(:pdf_publico => true)
  
      @relatorios.ano = @relatorios.ano
      @relatorios.matricula_aluno = current_user.matricula
      @relatorios.licenciatura = current_user.licenciatura
      @relatorios.periodo = current_user.periodo
      @relatorios.endereco = current_user.endereco
      @relatorios.numero = current_user.numero
      @relatorios.complemento = current_user.complemento
      @relatorios.bairro = current_user.bairro
      @relatorios.municipio = current_user.municipio
      @relatorios.cep = current_user.cep
      @relatorios.telefone = current_user.telefone
      @relatorios.cnpj = current_user.cnpj
      @relatorios.endereco_da_instituicao = current_user.endereco_da_instituicao
      @relatorios.complemento_da_instituicao = current_user.complemento_da_instituicao
      @relatorios.numero_da_instituicao = current_user.numero_da_instituicao
      @relatorios.bairro_da_instituicao = current_user.bairro_da_instituicao
      @relatorios.municipio_da_instituicao = current_user.municipio_da_instituicao
      @relatorios.cep_da_instituicao = current_user.cep_da_instituicao
      @relatorios.telefone_da_instituicao = current_user.telefone_da_instituicao
      @relatorios.representante_da_instituicao = @relatorios.representante_da_instituicao
      @relatorios.estado_da_instituicao = current_user.estado_da_instituicao
      @relatorios.uf = current_user.uf
      @relatorios.nome_social_termo = @relatorios.nome_social_termo
      @relatorios.apolice = current_user.apolice
      @relatorios.aluno_apresentacao_dois = current_user.nome_civil
  
      if @relatorios.save
        @relatoutro = Relatpublico.last
  
        RelatorioOutrosMailer.contact_message(@relatoutro, current_user).deliver
        flash[:notice] = 'Mensagem enviada com sucesso'
        redirect_to estagio_welcome_index_path, id: @relatorios.id,  notice: 'Relatório salvo com sucesso!'
      else
        redirect_to estagio_welcome_index_path, notice: 'Ocorreu um erro ao salvar o relatório, tente novamente mais tarde!'
      end
    end
  
    def status_impressao
      current_user.status_impressao = true
    end
  
    def user_params
      params.permit(:licenciatura)
    end
  
    def relatorio_params
      params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :estado_da_instituicao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :reitor, :periodo_de, :periodo_a, :matricula_aluno, :licenciatura, :cnpj, :endereco_da_instituicao, :complemento_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :representante_da_instituicao, :municipio_da_instituicao, :estado_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :numero, :aluno_semestre, :ano, :endereco, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :avaliador, :periodo, :uf, :estagio, :user_id, :nome_social_termo)
    end
  end