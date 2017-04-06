# frozen_string_literal: true

class Employee < ActiveRecord::Base
  include PublicId

  has_many :pictures, as: :imageable
end
