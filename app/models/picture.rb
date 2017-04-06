# frozen_string_literal: true

require 'paperclip'

class Picture < ActiveRecord::Base
  include Paperclip::Glue

  belongs_to :imageable, polymorphic: true

  has_attached_file :image,
                    styles:       { medium: '300x300>', thumb: '100x100>' },
                    path:         'uploads/:url',
                    default_url:  '/images/:style/missing.png'

  validates_attachment_content_type :image, content_type: %r{/\Aimage\/.*\z/}

  def to_json
    {
      id: id,
      name: name,
      image_file_name: image_file_name,
      image_content_type: image_content_type,
      image_file_size: image_file_size,
      image_url: image.url
    }.to_json
  end
end
