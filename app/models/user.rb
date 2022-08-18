class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :jwt_authenticatable, jwt_revocation_strategy: self, :authentication_keys => [:username]

  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  
  has_many :list_items
  has_many :books, through: :list_items
         
end
