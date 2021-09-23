# frozen_string_literal: true

Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('node_modules')

# if Rails.env.development? || Rails.env.production?
#   Rails.application.config.assets.precompile += %w[graphiql/rails/application.js
#                                                    graphiql/rails/application.css]
# end
