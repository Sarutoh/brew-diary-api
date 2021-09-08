# frozen_string_literal: true

module Mutations
  class CreateMashStep < BaseMutation
    argument :temperature, Integer, required: true
    argument :duration, Integer, required: true
    argument :brew_session_id, ID, required: true

    field :mash_step, Types::MashStepType, null: true
    field :errors, [String], null: false

    def resolve(duration:, temperature:, brew_session_id:)
      if user.nil?
        raise GraphQL::ExecutionError,
              'You need to authenticate to perform this action'
      end

      unless BrewSessions::MashStepPolicy.new(record: brew_session(brew_session_id), user: user).create?
        raise GraphQL::ExecutionError,
              'You are not authorize to perform this action'
      end

      mash_step = MashStep.new(
        duration: duration,
        temperature: temperature,
        brew_session_id: brew_session_id
      )

      if mash_step.save
        { mash_step: mash_step }
      else
        # :nocov:
        { errors: mash_step.errors.full_messages }
        # :nocov:
      end
    end

    private

    def brew_session(brew_session_id)
      BrewSession.find(brew_session_id)
    end

    def user
      @user ||= context[:current_user]
    end
  end
end
