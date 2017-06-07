class EventsController < ApplicationController
  def index
    @events = [
      {
        id: 1,
        title: "Sample",
        start: Time.now,
        end: 1.day.from_now
      },
      {
        id: 2,
        title: "Sample #2",
        start: Time.now,
        end: 1.day.from_now
      },
      {
        id: 3,
        title: "Sample #3",
        start: 1.week.from_now,
        end: 1.week.from_now + 2.days
      }
    ]
    
    respond_to do |format|
      format.json do
        render json: @events
      end
    end 
  end
end
