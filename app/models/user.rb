class User < ApplicationRecord

  validates_presence_of :nome_social, :email, :licenciatura, :periodo, :matricula

  validates_uniqueness_of :matricula, :email

  validates :pdf_centro, :pdf_campi, :pdf_outros, :status_impressao, presence: false

  validates :status, presence: true

  has_one_attached :avatar, dependent: :destroy
  #has_one_attached :signature, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  enum role: [:normal_user, :moderador, :admin]   
end
