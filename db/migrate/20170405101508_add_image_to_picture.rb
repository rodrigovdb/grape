# frozen_string_literal: true

require 'paperclip'

class AddImageToPicture < ActiveRecord::Migration
  include Paperclip::Schema

  def up
    add_attachment :pictures, :image
  end

  def down
    remove_attachment :pictures, :image
  end
end
