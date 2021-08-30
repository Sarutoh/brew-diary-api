# frozen_string_literal: true

module Types
  class BrewSessionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :volume, Integer, null: false
    field :description, String, null: true
    field :image_url, String, null: true
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    field :hops, Types::HopType, null: true
    field :mash_steps, Types::MashStepType, null: true
    field :ingredients, Types::IngredientType, null: true
  end
end