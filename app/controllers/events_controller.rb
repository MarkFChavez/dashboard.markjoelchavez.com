class EventsController < ApplicationController
  def index
    @events = current_user.events
    render json: @events
  end
end
