class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:moderator, :super_admin]

  validates :username, :email, :role, presence: true
  validates :email, uniqueness: true
end
