class Event < ApplicationRecord
  belongs_to :user
  validates :title, :color, :start_time, :end_time, presence: true
end
