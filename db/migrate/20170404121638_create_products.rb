# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :public_id

      t.timestamps
    end
  end
end
