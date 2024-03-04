json.merge! mensagem.slice(:id, :texto, :remetente_id, :destinatario_id, :created_at, :updated_at) do
    json.url mensagem_url(mensagem, format: :json)
    json.destinatario do
      destinatario = Destinatario.find(@mensagem.destinatario_id)
      json.extract! destinatario, :id, :nome_civil
    end
  end
  