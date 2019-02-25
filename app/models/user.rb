class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contributions
  has_many :comments
  has_many :votes

  validates :username, presence: true
  validates :admin, presence: true, default: false
end
