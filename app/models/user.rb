# frozen_string_literal: true

require 'active_support/all'

class User < ActiveRecord::Base
  include PublicId
  include Authenticable

  validates :email, presence: true,  length: { maximum: 255 }, on: :create
  validates :email, uniqueness: { case_sensitive: false }

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  before_create :generate_public_key

  private

  def generate_public_key
    self.public_key = generate_token
  end
end
