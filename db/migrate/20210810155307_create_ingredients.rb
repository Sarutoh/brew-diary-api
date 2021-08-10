# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :title, null: false
      t.float :weight
      t.string :image_url
      t.references :brew_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
