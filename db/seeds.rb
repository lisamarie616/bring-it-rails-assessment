# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "lisa@test.com", password: "password")
User.create(email: "scotty@buttons.com", password: "bones123")
User.create(email: "teddy@bear.com", password: "playtime")
User.create(email: "user1@test.com", password: "password")
User.create(email: "user2@test.com", password: "password")
User.create(email: "user3@test.com", password: "password")
User.create(email: "user4@test.com", password: "password")
User.create(email: "user5@test.com", password: "password")
User.create(email: "user6@test.com", password: "password")
User.create(email: "user7@test.com", password: "password")
User.create(email: "user8@test.com", password: "password")
User.create(email: "user9@test.com", password: "password")
User.create(email: "user10@test.com", password: "password")


Event.create(title: "Picnic", location: "Central Park", start_time: "2016-03-13 14:00:00", host_id: 1)
Event.create(title: "BBQ", location: "My backyard", start_time: "2016-03-15 12:00:00", host_id: 1)
Event.create(title: "Party", location: "My house", start_time: "2016-03-20 16:00:00", host_id: 2)
Event.create(title: "Potluck Dinner", location: "Rec Center", start_time: "2016-03-25 17:00:00", host_id: 3)
Event.create(title: "Celebration", location: "Bar", start_time: "2016-03-27 18:00:00", host_id: 3)

Item.create(name: "chips")
Item.create(name: "salsa")
Item.create(name: "wine")
Item.create(name: "beer")
Item.create(name: "dip")
Item.create(name: "cheese")
Item.create(name: "crackers")
Item.create(name: "pasta salad")
Item.create(name: "potato salad")
Item.create(name: "fruit")
Item.create(name: "bread")

Invitation.create(invited_event_id: 1, guest_id: 2, status: "yes")
Invitation.create(invited_event_id: 1, guest_id: 3, status: "yes")
Invitation.create(invited_event_id: 1, guest_id: 4, status: "no")
Invitation.create(invited_event_id: 1, guest_id: 5, status: "maybe")
Invitation.create(invited_event_id: 1, guest_id: 6, status: "yes")

EventItem.create(event_id: 1, item_id: 1, assigned_person_id: 1)
EventItem.create(event_id: 1, item_id: 2, assigned_person_id: 2)
EventItem.create(event_id: 1, item_id: 3, assigned_person_id: 3)
EventItem.create(event_id: 1, item_id: 4, assigned_person_id: 4)
EventItem.create(event_id: 1, item_id: 5, assigned_person_id: 5)