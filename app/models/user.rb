class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true
end
