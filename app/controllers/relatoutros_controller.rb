class RelatoutrosController < ApplicationController
  def index
    @relatorios = Relatoutro.all

    if current_user.licenciatura == 'Ciências da Natureza'
      redirect_to action: "edit"
    end

    respond_to do |format|
     format.html
     format.pdf do
       @relatorio = Relatoutro.all
       if current_user.role != "normal_user"
         @usuario_matricula = params['matricula']
       else
         @usuario_matricula = current_user.matricula
       end
       @users = current_user.update(:status_impressao => true)
       pdf = ParticularPdf.new(@relatorio, current_user, @usuario_matricula)
       send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
       ContactMailer.confirmacao_impressao(current_user).deliver
     end
    end
  end

  def update
    @relatorios = current_user.update(user_params)
    redirect_to relatorio_centro_index_path, notice: 'Dados Atualizados com sucesso!'
  end

  def create
    @relatorios = Relatoutro.new(relatorio_params)

    @users = current_user.update(:pdf_outros => true)

    @relatorios.data = @relatorios.data
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
    @relatorios.representante = current_user.representante


    if @relatorios.save
      @relatoutro = Relatoutro.last

      if current_user.role == "normal_user"
        RelatorioOutrosMailer.contact_message(@relatoutro, current_user).deliver
      end

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
    params.permit(:instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :periodo, :licenciatura, :semestre_apresentacao, :ano_apresentacao, :reitor, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :estado_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :numero, :aluno_semestre, :ano, :endereco, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :periodo_de, :periodo_a, :matricula_aluno, :aluno_periodo, :representante_da_instituicao, :seguradora, :apolice, :data, :avaliador)
  end
end
