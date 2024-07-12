class RelatorioOutrosMailer < ActionMailer::Base
  default :from => 'ecs-dirlic.centro@iff.edu.br'

  def contact_message(relatoutro, current_user)
    @relatoutro = relatoutro
    @current_user = current_user

    # mail(:to => current_user.email, :subject => 'Mensagem de Contato')
    mail(:to => 'ecs-dirlic.centro@iff.edu.br', :subject => 'Formulário de Estágio')
  end

end
