class EventsController < ApplicationController
  def index
    @events = events_by_session_user
    render json: @events, each_serializer: EventSerializer
  end

  def create
    @event = events_by_session_user.build(event_params)
    @event.save!

    render json: @event
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update!(event_params)

    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    
    render json: @event
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
