class Event < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :notifications, :as => :notifiable
  validates :title, :description, :location, :capacity, :start_date, :end_date, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
