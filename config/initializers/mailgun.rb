# frozen_string_literal: true

Mailgun.configure do |config|
  config.api_key = ENV.fetch("MAILGUN_API_KEY")
end
