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

* figure out how to handle errors caused by users entering incorrectly formatted data into the More Items and Guests fields on the events new page
* on the event show page, make items needed checkboxes that the user can select and it will then assign that item for that event to the user
* create static home page
* do i want to list invited events on the same page as hosted events? yes, probably...handle this
* add validations to all models, for events make sure end time is after start time
* update User.from_omniauth method to pull in the user's first and last name