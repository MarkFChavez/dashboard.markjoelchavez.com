class EventsController < ApplicationController
  def index
    @events = current_user.events
    render json: @events, each_serializer: EventSerializer
  end
end
