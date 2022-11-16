class RelatorioPublicoController < ApplicationController
  def index
    @relatorios = Relatpublico.all

    if current_user.licenciatura == 'Ciências da Natureza'
      redirect_to action: "edit"
    end

    respond_to do |format|
     format.html
     format.pdf do
       @relatorio = Relatpublico.all

       if current_user.role == "admin"
         @usuario_matricula = params['matricula']
       else
         @usuario_matricula = current_user.matricula
       end
       @users = current_user.update(:status_impressao => true)
       pdf = PublicosPdf.new(@relatorio, current_user, @usuario_matricula)
       send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'

       if current_user.role != "admin"
         ContactMailer.confirmacao_impressao(current_user).deliver
       end
     end
    end

  end

  def update
    @relatorios = current_user.update(user_params)
    redirect_to relatorio_publico_index_path, notice: 'Dados Atualizados com sucesso!'
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
    @relatorios.numero_da_instituicao = current_user.numero_da_instituicao
    @relatorios.bairro_da_instituicao = current_user.bairro_da_instituicao
    @relatorios.municipio_da_instituicao = current_user.municipio_da_instituicao
    @relatorios.cep_da_instituicao = current_user.cep_da_instituicao
    @relatorios.telefone_da_instituicao = current_user.telefone_da_instituicao
    @relatorios.representante = current_user.representante

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
    params.permit(:parceria_firmada_com, :denominada_estagio, :CNPJ_estagio, :rua_estagio, :numero_estagio, :periodo_letivo, :bairro_estagio, :municipio_estagio, :telefone_estagio, :representado_por, :ano, :semestre, :endereco, :bairro, :municipio, :estado, :cep, :periodo_de, :periodo_a, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :reitor, :aluno_semestre, :estado_da_instituicao)
  end
end
