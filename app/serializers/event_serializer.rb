class EventSerializer < ActiveModel::Serializer
  attributes :id, :type, :location
end
