class ContactMailer < ActionMailer::Base
  default :from => 'ecs-dirlic.centro@iff.edu.br'

  def contact_message(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'ecs-dirlic.centro@iff.edu.br', :subject => 'Formulário de Estágio - Aviso de Preenchimento de Termo')
  end

  def confirmacao_impressao(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'ecs-dirlic.centro@iff.edu.br', :subject => 'Formulário de Estágio - Confirmação de Impressão')
  end

  def ingresso_estagio(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'ecs-dirlic.centro@iff.edu.br', :subject => 'Formulário de Estágio - Pedido de acesso para preenchimento')
  end

  def mudanca_status(user)
    @user = user
    mail to: @user.email, subject: 'Mudança de Status'
  end
end

