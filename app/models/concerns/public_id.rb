# frozen_string_literal: true

module PublicId
  extend ActiveSupport::Concern

  included do
    before_create :set_public_id
  end

  private

  def set_public_id
    self.public_id = SecureRandom.urlsafe_base64(9).chop
  end
end
