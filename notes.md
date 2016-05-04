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
x set any necessary dependent: :destroy options
x update User.from_omniauth method to pull in the user's first and last name

* figure out how to handle errors caused by users entering incorrectly formatted data into the More Items and Guests fields on the events new page (implemented a quick fix for the guests field, but need to revisit; if incorreclty formatted data in the items field, it will just be saved to the db with bad format, so need to rethink that also)
* implement a better way to store and retrieve dates and times
* give host a way to assign items to guests (do this with a click event? --> if current_user == host then give options to assign to self or a guest)

JQUERY BRANCH
x add event serializer
x clean up styles on event index page
x add jquery to render info on event index page and create toggle effect
x clean up styles on event show page
x add previous and next buttons to event show page
x add jquery to event show page
x fix the way event show page is getting the next event, so only the current user's events get cycled through
x add policy for showing events
x move previous and next buttons above event element

* fix edit and delete buttons on event show page so they refer to the right event ID
* get remaining tabs on event show page working
* change start time and end time fields to calendar elements (are there bootstrap elements for this?)
* fix items and emails fields
* improve views with bootsnipp