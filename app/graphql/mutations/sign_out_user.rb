# frozen_string_literal: true

module Mutations
  class SignOutUser < Mutations::BaseMutation
    graphql_name 'SignOutUser'

    field :user, Types::UserType, null: false

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
        GraphQL::ExecutionError.new(I18n.t('mutations.not_signed_in'))
      end
    end
  end
end
