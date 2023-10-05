require 'replicate'

Replicate.configure do |config|
  config.api_token = Rails.application.credentials.replicate_api_key
  config.webhook_url = Rails.application.credentials.webhook_url
end
