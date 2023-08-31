class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :messages, dependent: :destroy
  has_many :users, through: :chat_participants
end
