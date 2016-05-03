class EventSerializer < ActiveModel::Serializer
  attributes :title, :location, :start_time, :end_time
end
