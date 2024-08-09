class RelatorioCentroController < ApplicationController
  def index
    @relatorios = Relatorio.all
  
    if current_user.licenciatura == 'Ciências da Natureza'
      return redirect_to action: "edit"
    end
  
    respond_to do |format|
      format.html
      format.pdf do
        @relatorio = Relatorio.all
        @usuario_matricula = current_user.role != "normal_user" ? params['matricula'] : current_user.matricula
        current_user.update(status_impressao: true)
  
        pdf = CentroPdf.new(@relatorio, current_user, @usuario_matricula)
  
        # Renderiza o PDF
        send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
  
        ContactMailer.confirmacao_impressao(current_user).deliver if current_user.role == "normal_user"
      end
    end
  end
  
  

  def update
    @relatorios = current_user.update(user_params)
   
    redirect_to relatorio_centro_index_path, notice: 'Dados Atualizados com sucesso!'
  end

  def destroy
    Rails.logger.info("Parâmetro user_id recebido: #{params[:user_id]}")
    @relatorio_centro = Relatorio.find_by(user_id: params[:user_id])
    if @relatorio_centro
      Rails.logger.info("Encontrou o Relatorio com ID: #{@relatorio_centro.id}")
      @relatorio_centro.destroy
      flash[:notice] = "Termo Campus Campos Centro excluído com sucesso."
    else
      Rails.logger.info("Relatorio não encontrado para user_id: #{params[:user_id]}")
      flash[:alert] = "Relatorio centro não encontrada."
    end
    redirect_to estagio_welcome_index_path
  end


  def create
    @relatorios = Relatorio.new(relatorio_params)

    @users = current_user.update(:pdf_centro => true)
   

    @relatorios.ano = @relatorios.ano
    @relatorios.nome_social_termo = @relatorios.nome_social_termo
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
    @relatorios.apolice = current_user.apolice
    @relatorios.uf = current_user.uf
    @relatorios.aluno_apresentacao_dois = current_user.nome_civil

    ContactMailer.contact_message(current_user).deliver

    flash[:notice] = 'Mensagem enviada com sucesso'

    if @relatorios.save
      redirect_to estagio_welcome_index_path, id: @relatorios.id,  notice: 'Relatório salvo com sucesso!'
    else
      redirect_to estagio_welcome_index_path, alert: 'Ocorreu um erro ao salvar o relatório, tente novamente mais tarde!'
    end
  end

  def user_params
    params.permit(:licenciatura)
  end

  def relatorio_params
    params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :aluno_semestre, :ano, :estado, :periodo_de, :periodo_a, :avaliador, :uf, :estagio, :user_id, :nome_social_termo)
  end
end

