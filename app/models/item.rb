class Item < ActiveRecord::Base
  has_many :event_items
  has_many :events, through: :event_items
  has_many :assigned_persons, through: :event_items

  def people_bringing
    assigned_persons.map {|person| person.full_name}.join(", ")
  end

  def pretty_name
    name.titleize
  end
end
