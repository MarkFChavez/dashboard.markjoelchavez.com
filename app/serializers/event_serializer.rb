class EventSerializer < ActiveModel::Serializer
  attributes :title, :created_at, :updated_at
  attribute :start
  attribute :end
  attribute :color

  belongs_to :user, serializer: UserSerializer

  # For FullCalendar compatibility
  def start
    object.start_time
  end

  def end
    object.end_time
  end

  def color
    object.color
  end
end
