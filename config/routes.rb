Rails.application.routes.draw do
  resources :emojis, only: %i[index show create destroy]
  namespace :webhooks do
    resources :emojis, only: :create
    resources :backgrounds, only: :create
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "emojis#index"
end
