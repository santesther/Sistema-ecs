require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "contact_message" do
    mail = ContactMailer.contact_message
    assert_equal "Contact message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "confirmacao_impressao" do
    mail = ContactMailer.confirmacao_impressao
    assert_equal "Confirmacao impressao", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "ingresso_estagio" do
    mail = ContactMailer.ingresso_estagio
    assert_equal "Ingresso estagio", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
