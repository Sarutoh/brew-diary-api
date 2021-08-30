# frozen_string_literal: true

module Mutations
  class SignOutUser < Mutations::BaseMutation
    graphql_name 'SignOutUser'

    field :user, Types::UserType, null: false
    field :authentication_token, String, null: false

    def resolve
      user = context[:current_user]

      if user.present?
        success = user.reset_authentication_token!

        MutationResult.call(
          obj: { user: user },
          success: success,
          errors: user.errors
        )
      else
        GraphQL::ExecutionError.new('User not signed in')
      end
    end
  end
end
