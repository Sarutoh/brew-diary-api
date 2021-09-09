# frozen_string_literal: true

module Mutations
  class CreateBrewSession < BaseMutation
    argument :volume, Float, required: true
    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_url, String, required: false

    field :brew_session, Types::BrewSessionType, null: true
    field :errors, [String], null: false

    def resolve(volume:, title:, description: nil, image_url: nil)
      if context[:current_user].nil?
        raise GraphQL::ExecutionError,
              I18n.t('mutations.unauthenticated')
      end

      brew_session = BrewSession.new(
        volume: volume,
        title: title,
        description: description,
        image_url: image_url,
        user: context[:current_user]
      )

      if brew_session.save
        { brew_session: brew_session }
      else
        # :nocov:
        { errors: brew_session.errors.full_messages }
        # :nocov:
      end
    end
  end
end
