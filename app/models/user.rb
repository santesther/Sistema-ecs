class User < ApplicationRecord

  validates_presence_of :nome_civil, :email, :licenciatura, :periodo, :matricula

  validates_uniqueness_of :matricula, :email

  validates :pdf_centro, :pdf_campi, :pdf_outros, :status_impressao, presence: false

  validates :status, presence: true

  mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar, dependent: :destroy


  validates_integrity_of  :avatar
  validates_processing_of :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  enum role: [:normal_user, :moderador, :admin]   
end
