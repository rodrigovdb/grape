# frozen_string_literal: true

class Product < ActiveRecord::Base
  include PublicId

  has_many :pictures, as: :imageable
end
