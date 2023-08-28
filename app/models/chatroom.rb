class Chatroom < ApplicationRecord
  belongs_to :event, dependent: :destroy
  has_many :messages
  has_many :users, through: :chat_participants
end
