class Event < ApplicationRecord
  belongs_to :user
  validates :title, :start_time, :end_time, presence: true

  before_save :increment_one_day_to_end_time

  private

    def increment_one_day_to_end_time
      self.end_time = self.end_time.end_of_day
    end
end
