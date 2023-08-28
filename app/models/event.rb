class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :requests
  has_one :chatroom
  has_many :notifications, :as => :notifiable
end
