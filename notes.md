describe all relationships, especially the aliased ones

x create user via devise
x add omniauth
x add seed data
x add bootstrap and bootswatch gems
x create navbar
x format sign up and sign in views
x integrate flash messages with devise and bootstrap
x add fields to user model (first_name and last_name)
x add filter methods to event and item
x add devise_invitable so users can invite other users
x add figaro to store environment variables (needed for action mailer)
x added section for guests on event new page
x added section for items on event new page
x event show page--ordered guests, who's bringing what, and still needed sections
x implement Destroy action for events
x add invited events to event index page
x create static home page and assign links in nav bar
x add permissions so users can only edit or delete events they are hosting (exception: all users can edit the items_attributes of all events so they can add items not on the list)
x add validations to models, for events make sure end time is after start time
x add link to unassign item on event show page
x add a view to show the user all items he/she is bringing to all events

* set any necessary dependent: :destroy options
* update User.from_omniauth method to pull in the user's first and last name
* figure out how to handle errors caused by users entering incorrectly formatted data into the More Items and Guests fields on the events new page (implemented a quick fix for the guests field, but need to revisit; if incorreclty formatted data in the items field, it will just be saved to the db with bad format, so need to rethink that also)
* implement a better way to store and retrieve dates and times
* REFACTOR!

<%= bootstrap_form_for @event do |f| %>
  <%= f.collection_check_boxes :event_items, @event.unassigned_items_sorted, :item_id, :item_name, hide_label: true %>
  <%= f.fields_for :items, @event.items.build do |items_fields| %>
      <%= items_fields.label "More Items" %>
      <div class="help-block">Bringing something not on the list? Enter it here. To add more than one of an item, enter "item:number". For example "homemade pie:2"</div>
      <%= items_fields.text_field :name, hide_label: true %>
    <% end %>
  <%= f.submit "BringIt!", class: "btn btn-primary btn-sm" %>
<% end %>

eventitems controller
@event = Event.find(params[:event_id])
    @event.items_attributes=(params[:event_item][:items])
    item_ids = params[:event_item][:item_id]
    item_ids.each do |id|
      item = EventItem.find_by(event: @event, item_id: id, assigned_person: nil)
      item.update(assigned_person: current_user) if item
    end