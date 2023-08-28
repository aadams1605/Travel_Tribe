class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :chatrooms, through: :chat_participants
  has_many :messages
  has_many :requests
  has_many :notifications
  validates :username, uniqueness: true
  validates :username, :description, :location, :gender, :age, presence: true
end
