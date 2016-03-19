class EventItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :item
  belongs_to :assigned_person, :class_name => "User"

  def item_name
    item.pretty_name
  end
end
