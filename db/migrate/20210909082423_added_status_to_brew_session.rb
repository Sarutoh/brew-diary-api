# frozen_string_literal: true

class AddedStatusToBrewSession < ActiveRecord::Migration[6.1]
  def change
    add_column :brew_sessions, :status, :string, null: false, default: 'initialized'
  end
end
