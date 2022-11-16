# Preview all emails at http://localhost:3000/rails/mailers/relatorio_outros_mailer
class RelatorioOutrosMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/relatorio_outros_mailer/contact_message
  def contact_message
    RelatorioOutrosMailer.contact_message
  end

end
