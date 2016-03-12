class Item < ActiveRecord::Base
  has_many :event_items
  has_many :events, through: :event_items
end
