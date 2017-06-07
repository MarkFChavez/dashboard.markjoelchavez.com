class EventSerializer < ActiveModel::Serializer
  attribute :title
  attribute :start
  attribute :end

  belongs_to :user, serializer: UserSerializer

  # For FullCalendar compatibility
  def start
    object.start_time
  end

  def end
    object.end_time
  end
end
