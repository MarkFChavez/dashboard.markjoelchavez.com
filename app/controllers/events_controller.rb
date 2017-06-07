class EventsController < ApplicationController
  def index
    @events = current_user.events
    render json: @events, each_serializer: EventSerializer
  end

  def create
    @event = current_user.events.build(event_params)
    @event.end_time = @event.end_time.end_of_day
    @event.save!
  end

  private

    def event_params
      params.require(:event).
        permit(:title, :start_time, :end_time)
    end

end
