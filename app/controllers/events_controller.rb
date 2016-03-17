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
    raise params.inspect
  end

  def update
  end

  def destroy
  end
end
