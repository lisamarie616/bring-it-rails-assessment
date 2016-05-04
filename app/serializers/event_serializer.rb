class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :start_time, :end_time
  has_one :host, serializer: HostSerializer
  has_many :event_items
end
