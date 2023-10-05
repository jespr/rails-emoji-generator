Rails.application.routes.draw do
  resources :emojis, only: %i[index show new create destroy]
  post "webhooks" => "webhooks#create"

  get "up" => "rails/health#show", as: :rails_health_check
end
