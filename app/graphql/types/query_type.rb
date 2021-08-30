# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :brew_sessions, [Types::BrewSessionType], null: false
    field :users, [Types::UserType], null: false
    field :hops, [Types::HopType], null: false
    field :ingredients, [Types::IngredientType], null: false
    field :mash_steps, [Types::MashStepType], null: false

    def brew_sessions
      BrewSession.all
    end

    def users
      User.all
    end

    def ingredients
      Ingredient.all
    end

    def hops
      Hop.all
    end

    def mash_steps
      MashStep.all
    end
  end
end
