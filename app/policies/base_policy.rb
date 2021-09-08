# frozen_string_literal: true

class BasePolicy
  def initialize(record:, user:)
    @record = record
    @user = user
  end

  private

  attr_reader :user, :record
end
