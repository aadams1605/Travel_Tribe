class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :notifications, :as => :notifiable
  has_many :chat_participants
  has_many :chatrooms, through: :chat_participants
  has_many :messages, dependent: :destroy
  has_many :requests, dependent: :destroy
  # validates :requests, uniqueness: {scope: [:user_id, :event_id]}
  has_many :notifications, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :username, uniqueness: true
  validates :username, :description, :location, :gender, :age, presence: true

  before_save :capitalize

  def capitalize
    self.username = self.username.capitalize
  end
end
