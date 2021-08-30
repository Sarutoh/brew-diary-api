# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::RegisterUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :sign_out_user, mutation: Mutations::SignOutUser

    field :create_brew_session, mutation: Mutations::CreateBrewSession
  end
end
