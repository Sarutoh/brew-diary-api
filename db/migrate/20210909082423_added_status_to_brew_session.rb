# frozen_string_literal: true

class AddedStatusToBrewSession < ActiveRecord::Migration[6.1]
  def change
    add_column :brew_sessions, :status, :string, null: false, default: 'initialized'

    add_index :brew_sessions, :status
  end
end
