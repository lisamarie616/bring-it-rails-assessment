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

* need to fix event assigned_items and unassigned_items methods, they're causing problems on the event show page
* need to consider how to allow a user to add more than one of a particular item
* on the event new page, need to add section for items for the event
* on the event show page, make items needed checkboxes that the user can select and it will then assign that item for that event to the user
* create static home page
* do i want to list invited events on the same page as hosted events? yes, probably...handle this
* add validations to all models, for events make sure end time is after start time
* update User.from_omniauth method to pull in the user's first and last name