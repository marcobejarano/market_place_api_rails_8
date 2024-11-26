Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  # API definition
  namespace :api, defaults: { format: :json } do
    # We are going to list our resources here
  end
end
