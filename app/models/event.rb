class Event < ActiveRecord::Base
  has_many :event_users, :foreign_key => :invited_event_id
  has_many :guests, :through => :event_users
  belongs_to :host, :class_name => "User"
  has_many :event_items
  has_many :items, through: :event_items

  def assigned_items
    items.joins(:event_items).where.not(event_items: {assigned_person_id: nil}).uniq
  end

  def unassigned_items
    items.joins(:event_items).where(event_items: {assigned_person_id: nil})
  end
end
