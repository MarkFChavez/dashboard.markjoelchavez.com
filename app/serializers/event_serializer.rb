class EventSerializer < ActiveModel::Serializer
  attributes :title, :created_at, :updated_at
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
