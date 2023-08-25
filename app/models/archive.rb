class Archive < ApplicationRecord
  belongs_to :user

  before_destroy :deletar_anexo
  
  mount_uploader :documents, DocumentUploader
  
  def deletar_anexo
    if (self.documents?)
      self.remove_documents!
    end
  end

end
