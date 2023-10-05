require 'replicate'

Replicate.configure do |config|
  config.api_token = Rails.application.credentials.replicate_api_key
  config.webhook_url = "https://72e9bf298005.ngrok.app/webhooks"
end
