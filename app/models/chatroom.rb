class Chatroom < ApplicationRecord
  belongs_to :event, optional: true
  has_many :chat_participants
  has_many :users, through: :chat_participants, dependent: :destroy
  has_many :messages, dependent: :destroy

  def participants
    if event
      event.attendees_including_creator
    else
      users
    end
  end
end
