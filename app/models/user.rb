class User < ApplicationRecord

  validates_presence_of :nome_civil, :email, :licenciatura, :periodo, :matricula, :telefone, :endereco, :numero, :bairro, 
  :municipio, :cep, :uf, :nome_da_instituicao, :cnpj, :tipo_da_instituicao, :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao,
  :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :estado_da_instituicao

  validates_uniqueness_of :matricula, :email

  validates :pdf_centro, :pdf_campi, :pdf_outros, :status_impressao, presence: false

  validates :status, presence: true

  has_many :carta_apresentacoes

  mount_uploader :avatar, AvatarUploader

  validates_integrity_of  :avatar
  validates_processing_of :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  enum role: [:normal_user, :moderador, :admin]   
end
