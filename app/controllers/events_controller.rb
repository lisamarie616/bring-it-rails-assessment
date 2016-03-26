class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hosted_events = current_user.hosted_events
  end

  def show
    @event = Event.find(params[:id])
    @event_item = @event.event_items.build
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    @event.start_time = Chronic.parse(params[:event][:start_time])
    @event.end_time = Chronic.parse(params[:event][:end_time])
    if @event.save
      flash[:success] = "Your event was successfully created!"
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      @event.start_time = Chronic.parse(params[:event][:start_time])
      @event.end_time = Chronic.parse(params[:event][:end_time])
      @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event deleted"
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :start_time, :end_time, :item_ids =>[], :items_attributes => [:name], :guests_attributes => [:email])
    end
end