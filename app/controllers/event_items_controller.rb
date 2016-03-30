class EventItemsController < ApplicationController
  def update
    @event = Event.find_by(id: params[:event_id])
    @event_item = @event.event_items.find_by(id: params[:id])
    @event_item.update(assigned_person: current_user)
    redirect_to event_path(@event)
  end

  def unassign
    @event = Event.find_by(id: params[:event_id])
    @event_item = @event.event_items.find_by(id: params[:id])
    @event_item.update(assigned_person: nil)
    redirect_to event_path(@event)
  end

  def index
    @hosted_events = current_user.hosted_events
    @invited_events = current_user.invited_events
  end
end
