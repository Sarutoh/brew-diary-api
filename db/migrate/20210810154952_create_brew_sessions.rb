# frozen_string_literal: true

class CreateBrewSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :brew_sessions do |t|
      t.string :title, null: false
      t.integer :volume, null: false
      t.text :description
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
