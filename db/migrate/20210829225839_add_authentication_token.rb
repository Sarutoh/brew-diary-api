# frozen_string_literal: true

class AddAuthenticationToken < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authentication_token, :text
    add_column :users, :authentication_token_created_at, :datetime

    add_index :users, :authentication_token, unique: true
  end
end
