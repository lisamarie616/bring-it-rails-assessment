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

* on the event show page, make items needed checkboxes that the user can select and it will then assign that item for that event to the user
* need to figure out how to incorporate both checkboxes and an empty field so the user can check off items and enter a new item if they want to bring something not on the list; at the moment a nested form (form_for [@event, @event.items]) isn't allowing the accepts_nested_attributes for items to render properly but not doing a nested form (form_for @event) while that renders the fields properly to process accepts_nested_attributes for items has the incorrect action; think about how to process both checkboxes and an empty field in one click
* add RSVP status to guests on event show page
* create static home page
* do i want to list invited events on the same page as hosted events? yes, probably...handle this
* add validations to all models, for events make sure end time is after start time
* set any necessary dependent: :destroy options
* update User.from_omniauth method to pull in the user's first and last name
* figure out how to handle errors caused by users entering incorrectly formatted data into the More Items and Guests fields on the events new page (implemented a quick fix for the guests field, but need to revisit; if incorreclty formatted data in the items field, it will just be saved to the db with bad format, so need to rethink that also)
* EventItems Controller create method--iteration in the controller feels wrong, any other way to accomplish this??

<%= bootstrap_form_for ([@event, @event_item]) do |f| %>
  <%= f.collection_check_boxes :item_id, @event.unassigned_items_sorted, :item_id, :item_name, hide_label: true %>
  <%= f.submit "BringIt!", class: "btn btn-primary btn-sm" %>
<% end %>

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