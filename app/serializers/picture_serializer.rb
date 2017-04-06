# frozen_string_literal: true

class PictureSerializer < ActiveModel::Serializer
  attributes  :id, :name, :image_file_name, :image_content_type, :image_file_size, :image_url

  def id
    object.public_id
  end

  def image_url
    object.image.url
  end
end
