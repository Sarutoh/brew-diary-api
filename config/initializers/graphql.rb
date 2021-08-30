# frozen_string_literal: true

if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = lambda { |_ctx|
    "bearer #{ENV['JWT_TOKEN']}"
  }
end
