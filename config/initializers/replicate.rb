require 'replicate'

Replicate.configure do |config|
  config.api_token = Rails.application.credentials.replicate_api_token
end
