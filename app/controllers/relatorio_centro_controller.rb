class RelatorioCentroController < ApplicationController
  def index
    @relatorios = Relatorio.all

    if current_user.licenciatura == 'Ciências da Natureza'
      redirect_to action: "edit"
    end

    respond_to do |format|
     format.html
     format.pdf do
       @relatorio = Relatorio.all
       if current_user.role != "normal_user"
         @usuario_matricula = params['matricula']
       else
         @usuario_matricula = current_user.matricula
       end
       @users = current_user.update(:status_impressao => true)
       pdf = CentroPdf.new(@relatorio, current_user, @usuario_matricula)
       send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'

       if current_user.role == "normal_user"
         ContactMailer.confirmacao_impressao(current_user).deliver
       end
     end
    end
  end

  def update
    @relatorios = current_user.update(user_params)
   
    redirect_to relatorio_centro_index_path, notice: 'Dados Atualizados com sucesso!'
  end

  def create
    @relatorios = Relatorio.new(relatorio_params)

    @users = current_user.update(:pdf_centro => true)

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
    params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :matricula_aluno, :aluno_semestre, :ano, :endereco, :numero, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :estado_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :apolice, :seguradora, :data)
  end
end

