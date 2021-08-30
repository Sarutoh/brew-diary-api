# frozen_string_literal: true

module Types
  class IngredientType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :weight, Float, null: true
    field :pieces, Integer, null: true
    field :image_url, String, null: true
    field :brew_session_id, Integer, null: true
  end
end
