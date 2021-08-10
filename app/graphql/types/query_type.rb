# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :brew_sessions, [Types::BrewSessionType], null: false

    def brew_sessions
      BrewSession.all
    end
  end
end
