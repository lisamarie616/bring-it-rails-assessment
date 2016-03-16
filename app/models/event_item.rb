class EventItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :item
  belongs_to :assigned_person, :class_name => "User"

  def item_name
    self.item.name.titleize
  end

  def assigned_person_name
    self.assigned_person.email
  end
end
