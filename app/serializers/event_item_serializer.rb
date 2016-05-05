class EventItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :item
  has_one :assigned_person, serializer: AssignedPersonSerializer
end
