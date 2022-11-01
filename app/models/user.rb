class User < ApplicationRecord
  has_one_attached :avatar

  scope :search, ->(query) { where("name like ?", "%#{query}%")}
  validates :status, presence: true
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  enum role: [:normal_user, :admin]    
end
