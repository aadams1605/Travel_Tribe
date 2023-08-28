class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :notifications, :as => :notifiable
  validate :content, presence: true
end
