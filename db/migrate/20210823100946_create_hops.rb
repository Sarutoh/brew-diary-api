# frozen_string_literal: true

class CreateHops < ActiveRecord::Migration[6.1]
  def change
    create_table :hops do |t|
      t.string :title
      t.float :weight

      t.references :brew_session
    end
  end
end
