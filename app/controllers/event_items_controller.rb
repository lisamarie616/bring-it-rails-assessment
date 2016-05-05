class EventItemsController < ApplicationController

  def update
    @event = load_event
    @event_item = load_event_item
    @event_item.update(assigned_person: current_user)
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.json { render json: @event_item }
    end
  end

  def unassign
    @event = load_event
    @event_item = load_event_item
    @event_item.update(assigned_person: nil)
    redirect_to event_path(@event)
  end

  def index
    @hosted_events = current_user.hosted_events
    @invited_events = current_user.invited_events
  end

  private
    def load_event_item
      EventItem.find(params[:id])
    end
end
