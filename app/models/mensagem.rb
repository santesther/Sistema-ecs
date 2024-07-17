class Mensagem < ApplicationRecord
    belongs_to :remetente, class_name: "User"
    belongs_to :destinatario, class_name: "User"
  
    validates_presence_of :texto
    
    self.per_page = 10
end
