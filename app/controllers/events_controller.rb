class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hosted_events = current_user.hosted_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.start_time = Chronic.parse(params[:event][:start_time])
    @event.end_time = Chronic.parse(params[:event][:end_time])
    if @event.save
      flash[:success] = "Your event was successfully created!"
      redirect_to event_path(@event)
    else
      redirect_to :new
    end
  end

  def update
  end

  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :start_time, :end_time, :guests_attributes => [:email])
    end
end