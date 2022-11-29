class ContactMailer < ActionMailer::Base
  default :from => 'nappdirlic.centro@gmail.com'

  def contact_message(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'nappdirlic.centro@gmail.com', :subject => 'Formulário de Estágio')
  end

  def confirmacao_impressao(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'nappdirlic.centro@gmail.com', :subject => 'Formulário de Estágio')
  end

  def ingresso_estagio(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'nappdirlic.centro@gmail.com', :subject => 'Formulário de Estágio')
  end

  def mudanca_status(current_user)
    @current_user = current_user
    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'nappdirlic.centro@gmail.com', :subject => 'Formulário de Estágio')
  end
end

