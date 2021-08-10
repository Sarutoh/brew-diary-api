# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_brew_session, mutation: Mutations::CreateBrewSession
  end
end
