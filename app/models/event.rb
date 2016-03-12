class Event < ActiveRecord::Base
  has_many :invitations, :foreign_key => :invited_event_id
  has_many :guests, :through => :invitations
  belongs_to :host, :class_name => "User"
  has_many :event_items
  has_many :items, through: :event_items
end
