# frozen_string_literal: true

module Mutations
  class SignInUser < Mutations::BaseMutation
    graphql_name 'SignInUser'

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false

    def resolve(args)
      user = User.find_for_database_authentication(email: args[:email])

      if user.present?
        if user.valid_password?(args[:password])
          context[:current_user] = user
          MutationResult.call(obj: { user: user }, success: true)
        else
          GraphQL::ExecutionError.new(I18n.t('mutations.incorrect_values'))
        end
      else
        GraphQL::ExecutionError.new(I18n.t('mutations.not_registered'))
      end
    end
  end
end
