class EventsController < ApplicationController
  def index
    @events = current_user.events
    render json: @events, each_serializer: EventSerializer
  end

  def create
    current_user.events.create!(event_params)
  end

  private

    def event_params
      params.require(:event).
        permit(:title, :start_time, :end_time)
    end

end
