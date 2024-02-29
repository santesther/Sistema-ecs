json.extract! mensagem, :id, :texto, :remetente, :destinatario, :created_at, :updated_at
json.url mensagem_url(mensagem, format: :json)