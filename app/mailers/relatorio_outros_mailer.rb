class RelatorioOutrosMailer < ActionMailer::Base
  default :from => 'nappdirlic.centro@gmail.com'

  def contact_message(relatoutro, current_user)
    @relatoutro = relatoutro
    @current_user = current_user

    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'nappdirlic.centro@gmail.com', :subject => 'Formulário de Estágio')
  end

end
