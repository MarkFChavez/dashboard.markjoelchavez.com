class EventSerializer < BaseSerializer
  attributes :id, :title, :color
  attribute :start
  attribute :end
  attribute :color
  attribute :update_path
  attribute :remove_path

  belongs_to :user, serializer: UserSerializer

  # For FullCalendar compatibility
  def start
    object.start_time.beginning_of_day
  end

  def end
    object.end_time.end_of_day
  end

  def update_path
    event_path(object)
  end

  def remove_path
    event_path(object)
  end
end
