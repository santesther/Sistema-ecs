class RelatorioCampiController < ApplicationController
  def index
    @relatorios = Relatcampi.all

    if current_user.licenciatura == 'Ciências da Natureza'
      redirect_to action: "edit"
    end

    respond_to do |format|
     format.html
     format.pdf do
       @relatorio = Relatcampi.all
       if current_user.role != "normal_user"
         @usuario_matricula = params['matricula']
       else
         @usuario_matricula = current_user.matricula
       end
       @users = current_user.update(:status_impressao => true)
       pdf = CampiPdf.new(@relatorio, current_user, @usuario_matricula)
       send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'

       if current_user.role == "normal_user"
         ContactMailer.confirmacao_impressao(current_user).deliver
       end
     end
    end
  end

  def update
    @relatorios = current_user.update(user_params)
    redirect_to relatorio_campi_index_path, notice: 'Dados Atualizados com sucesso!'
  end

  def destroy
    Rails.logger.info("Parâmetro user_id recebido: #{params[:user_id]}")
    @relatorio_campi = Relatcampi.find_by(user_id: params[:user_id])
    if @relatorio_campi
      Rails.logger.info("Encontrou o Relatorio Campi com ID: #{@relatorio_campi.id}")
      @relatorio_campi.destroy
      flash[:notice] = "Relatorio Campi excluído com sucesso."
    else
      Rails.logger.info("Relatorio Campi não encontrado para user_id: #{params[:user_id]}")
      flash[:alert] = "Relatorio Campi não encontrada."
    end
    redirect_to estagio_welcome_index_path
  end

  def create
    @relatorios = Relatcampi.new(relatorio_params)

    @users = current_user.update(:pdf_campi => true)

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
    @relatorios.telefone_da_instituicao = current_user.telefone_da_instituicao
    @relatorios.representante_da_instituicao = @relatorios.representante_da_instituicao
    @relatorios.apolice = current_user.apolice
    @relatorios.UF = current_user.UF


    ContactMailer.contact_message(current_user).deliver


    flash[:notice] = 'Mensagem enviada com sucesso'

    if @relatorios.save
      redirect_to estagio_welcome_index_path, id: @relatorios.id,  notice: 'Relatório salvo com sucesso!'
    else
      redirect_to estagio_welcome_index_path, notice: 'Ocorreu um erro ao salvar o relatório, tente novamente mais tarde!'
    end
  end

  def user_params
    params.permit(:licenciatura)
  end

  def relatorio_params
    params.permit(:apolice, :seguradora, :data, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :estado_da_instituicao, :representante_da_instituicao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador, :UF, :estagio, :user_id)
  end
end


