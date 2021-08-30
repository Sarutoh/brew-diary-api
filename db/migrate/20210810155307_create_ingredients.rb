# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :title, null: false
      t.float :weight
      t.integer :pieces
      t.string :image_url
      t.references :brew_session
    end
  end
end
