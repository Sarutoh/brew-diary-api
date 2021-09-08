# frozen_string_literal: true

module Types
  class MashStepType < Types::BaseObject
    field :id, ID, null: false
    field :temperature, Integer, null: false
    field :duration, Integer, null: false

    field :brew_session_id, ID, null: false
  end
end
