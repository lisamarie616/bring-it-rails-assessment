class EventItemsController < ApplicationController

  def update
    @event = load_event
    @event_item = load_event_item
    @event_item.update(assigned_person: current_user)
    redirect_to event_path(@event)
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

  def load_event
    Event.find_by(id: params[:event_id])
  end

  def load_event_item
    EventItem.find_by(id: params[:id])
  end
end
