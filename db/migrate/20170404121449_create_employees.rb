# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :public_id

      t.timestamps
    end
  end
end
