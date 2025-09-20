# frozen_string_literal: true

# frozen_string_literal: true
require "omniauth/rails_csrf_protection"


OmniAuth.config.path_prefix = '/admins/auth'

Devise.setup do |config|
  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Authentication configuration
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  # ==> OmniAuth configuration (Google OAuth2)
  config.omniauth :google_oauth2,
                  ENV['GOOGLE_OAUTH_CLIENT_ID'],
                  ENV['GOOGLE_OAUTH_CLIENT_SECRET'],
                  {
                    scope: 'email,profile',
                    prompt: 'select_account',
                    access_type: 'offline',
                    redirect_uri: 'http://localhost:3000/admins/auth/google_oauth2/callback'
                  }

  # ==> Hotwire/Turbo configuration
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  puts ">>>>> Loaded OmniAuth with client_id=#{ENV['GOOGLE_OAUTH_CLIENT_ID']}"
end
