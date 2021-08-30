# frozen_string_literal: true

# :nocov:
if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = lambda { |_ctx|
    "bearer #{ENV['JWT_TOKEN']}"
  }
end
# :nocov:
