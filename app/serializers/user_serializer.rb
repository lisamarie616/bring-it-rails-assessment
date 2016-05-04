class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :hosted_events, serializer: EventIdSerializer
  has_many :invited_events, serializer: EventIdSerializer
end
