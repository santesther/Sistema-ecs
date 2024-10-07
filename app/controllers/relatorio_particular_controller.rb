class RelatorioParticularController < ApplicationController
  def index
    @relatorios = Relatparticular.all
  
    if current_user.licenciatura == 'Ciências da Natureza'
      return redirect_to action: "edit"
    end
  
    respond_to do |format|
      format.html
      format.pdf do
        @relatorio = Relatparticular.all
        @usuario_matricula = current_user.role != "normal_user" ? params['matricula'] : current_user.matricula
        current_user.update(status_impressao: true)
        pdf = ParticularPdf.new(@relatorio, current_user, @usuario_matricula)
        send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
  
        ContactMailer.confirmacao_impressao(current_user).deliver if current_user.role == "normal_user"
      end
    end
  end
  

  def update
    @relatorios = current_user.update(user_params)
    redirect_to relatorio_particular_index_path, notice: 'Dados Atualizados com sucesso!'
  end

  def destroy
    Rails.logger.info("Parâmetro user_id recebido: #{params[:user_id]}")
    @relatorio_particular = Relatparticular.find_by(user_id: params[:user_id])
    if @relatorio_particular
      Rails.logger.info("Encontrou a carta de apresentação com ID: #{@relatorio_particular.id}")
      @relatorio_particular.destroy
      flash[:notice] = "Termo Particular excluído com sucesso."
    else
      Rails.logger.info("Relatorio aditivo centro não encontrada para user_id: #{params[:user_id]}")
      flash[:alert] = "Termo Particular não encontrado."
    end
    redirect_to estagio_welcome_index_path
  end

  def create
    @relatorios = Relatparticular.new(relatorio_params)

    @users = current_user.update(:pdf_particular => true)

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
    @relatorios.numero_da_instituicao = current_user.numero_da_instituicao
    @relatorios.bairro_da_instituicao = current_user.bairro_da_instituicao
    @relatorios.municipio_da_instituicao = current_user.municipio_da_instituicao
    @relatorios.cep_da_instituicao = current_user.cep_da_instituicao
    @relatorios.complemento_da_instituicao = current_user.complemento_da_instituicao
    @relatorios.telefone_da_instituicao = current_user.telefone_da_instituicao
    @relatorios.representante_da_instituicao = @relatorios.representante_da_instituicao
    @relatorios.estado_da_instituicao = current_user.estado_da_instituicao
    @relatorios.apolice = current_user.apolice
    @relatorios.nome_social_termo = @relatorios.nome_social_termo
    @relatorios.aluno_apresentacao_dois = current_user.nome_civil
    @relatorios.uf = current_user.uf
    @relatorios.prefeitura = @relatorios.prefeitura


    if @relatorios.save
      @relatoutro = Relatparticular.last

      ContactMailer.contact_message(current_user).deliver

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
    params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :representante_da_instituicao, :aluno_apresentacao, :estado_da_instituicao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :estado_da_instituicao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador, :uf, :estagio, :user_id, :nome_social_termo, :prefeitura, :complemento_da_instituicao)
  end
end
