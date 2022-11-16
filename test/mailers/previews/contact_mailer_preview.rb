# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact_message
  def contact_message
    ContactMailer.contact_message
  end

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/confirmacao_impressao
  def confirmacao_impressao
    ContactMailer.confirmacao_impressao
  end

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/ingresso_estagio
  def ingresso_estagio
    ContactMailer.ingresso_estagio
  end

end
