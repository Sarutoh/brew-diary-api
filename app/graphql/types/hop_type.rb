# frozen_string_literal: true

module Types
  class HopType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :weight, Float, null: true
    field :brew_session_id, Integer, null: true
  end
end
