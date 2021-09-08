# frozen_string_literal: true

module BrewSessions
  class MashStepPolicy < BasePolicy
    def create?
      record.user_id == user.id
    end
  end
end
