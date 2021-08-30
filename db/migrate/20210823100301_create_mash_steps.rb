# frozen_string_literal: true

class CreateMashSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :mash_steps do |t|
      t.integer :temperature, null: false
      t.integer :duration, null: false

      t.references :brew_session, null: false, foreign_key: true
    end
  end
end
