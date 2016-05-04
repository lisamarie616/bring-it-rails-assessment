class EventItemSerializer < ActiveModel::Serializer
  has_one :item
  has_one :assigned_person, serializer: AssignedPersonSerializer
end
