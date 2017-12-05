# frozen_string_literal: true

class BicycleSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :color, :serial_number, :size
  attributes :editable, :url, :stolen

  def editable
    scope == object.user
  end

  def stolen
    object.events.order(:created_at).last&.event_type=='stolen'
  end
end
