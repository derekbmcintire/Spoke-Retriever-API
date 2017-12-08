class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_type, :location
end
