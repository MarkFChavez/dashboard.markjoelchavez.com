class EventsController < ApplicationController
  def index
    @events = events_by_session_user
    render json: @events, each_serializer: EventSerializer
  end

  def create
    @event = events_by_session_user.build(event_params)
    @event.set_end_time
    @event.save!
  end

  private

    def events_by_session_user
      Event.belonging_to(current_user)
    end

    def event_params
      params.require(:event).
        permit(:title, :start_time, :end_time, :color)
    end

end
