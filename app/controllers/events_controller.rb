class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hosted_events = current_user.hosted_events
    @invited_events = current_user.invited_events
  end

  def show
    @event = load_event
    @event_item = @event.event_items.build
  end

  def new
    @event = Event.new
  end

  def edit
    @event = load_event
  end

  def create
    @event = Event.new(host: current_user)
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      flash[:success] = "Your event was successfully created!"
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @event = load_event
    if @event.update(event_params)
      @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = load_event
    authorize @event
    @event.destroy
    flash[:notice] = "Event deleted"
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(policy(@event).permitted_attributes)
    end

    def load_event
      Event.find(params[:id])
    end
end