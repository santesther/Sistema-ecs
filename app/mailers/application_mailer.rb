class ApplicationMailer < ActionMailer::Base
  default from: 'napp_dirlic.centro@iff.edu.br'
  layout 'mailer'

  def atividade_enviada(current_user, archive)
    @current_user = current_user
    @archive = archive

    mail :to => 'napp_dirlic.centro@iff.edu.br', :subject => 'Envio de PDF - ' + @current_user.nome_civil
  end

  def atividade_editada(current_user, archive)
    @current_user = current_user
    @archive = archive

    mail :to => 'napp_dirlic.centro@iff.edu.br', :subject => 'Edição de PDF - ' + @current_user.nome_civil
  end

  def atividade_avaliada(current_user, archive, aluno_da_atividade)
    @current_user = current_user
    @archive = archive
    @aluno_da_atividade = aluno_da_atividade

    mail(:to => @aluno_da_atividade.email, :subject => 'NAPP DIRLIC - Seu PDF foi Avaliado!')
  end

  def mensagem_enviada(mensagem)
    @mensagem = mensagem

    mail(:to => mensagem.destinatario.email, :subject => 'NAPP DIRLIC - Notificação de ATPA')
  end
end