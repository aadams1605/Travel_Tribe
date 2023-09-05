class Event < ApplicationRecord
  after_create :create_chatroom
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :notifications, :as => :notifiable
  validates :title, :description, :location, :capacity, :start_date, :end_date, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def attendees
    User.joins(:requests).where(requests: { event: self, status: "accepted" })
  end

  def attendees_including_creator
    users = attendees + User.joins(:events).where(events: {id: id } )
    User.where(id: users.pluck(:id))
  end

  def is_full?
    self.attendees.count >= self.capacity
  end

  private

  def create_chatroom
    Chatroom.create(event: self)
  end
end
