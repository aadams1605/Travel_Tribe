class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :chat_participants
  has_many :users, through: :chat_participants, dependent: :destroy
  has_many :messages, dependent: :destroy
end
