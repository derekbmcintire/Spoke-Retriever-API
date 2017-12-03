# frozen_string_literal: true

class BicycleSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :color, :serial_number, :size
  attributes :editable, :url, :stolen

  def editable
    scope == object.user
  end

  def stolen
    object.events.where("event_type='stolen'").count.positive?
  end
end
