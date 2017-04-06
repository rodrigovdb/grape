# frozen_string_literal: true

class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name

  def id
    object.public_id
  end
end
