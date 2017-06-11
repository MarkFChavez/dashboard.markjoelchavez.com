class Event < ApplicationRecord
  belongs_to :user
  validates :title, :color, :start_time, :end_time, presence: true

  def self.belonging_to(user)
    Event.where(user: user)
  end

  def set_end_time
    self.end_time = self.end_time.end_of_day
  end
end
