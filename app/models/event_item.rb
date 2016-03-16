class EventItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :item
  belongs_to :assigned_person, :class_name => "User"
end
