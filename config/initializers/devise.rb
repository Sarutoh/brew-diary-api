# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = '<Brew Diary no-reply@brew-diary.com>'

  config.mailer = 'Devise::Mailer'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = %i[http_auth token_auth]

  config.stretches = Rails.env.test? ? 1 : 12

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.navigational_formats = []

  config.sign_out_via = :delete

  config.http_authenticatable = [:token]
end

Devise::TokenAuthenticatable.setup do |config|
  config.token_expires_in = 1.day

  config.token_authentication_key = :other_key_name

  config.should_reset_authentication_token = true

  config.should_ensure_authentication_token = true
end
