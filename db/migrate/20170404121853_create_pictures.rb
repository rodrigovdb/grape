# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string      :name
      t.string      :public_id
      t.references  :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
