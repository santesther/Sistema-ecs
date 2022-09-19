class User < ApplicationRecord
  has_one_attached :avatar
  has_one :instituicao
  accepts_nested_attributes_for :instituicao

  scope :search, ->(query) { where("name like ?", "%#{query}%")}
  
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  enum role: [:normal_user, :admin]       
end
