Rails.application.routes.draw do
  resources :patterns

  get "up" => "rails/health#show", as: :rails_health_check

  #get '/patterns', to: 'patterns#index'
  #post '/patterns/bulkUpload', to: 'patterns#bulkUpload'

  # Optional: keep this only if you re-enable the recommendations route
  # resources :patterns do
  #   member do
  #     get :recommendations
  #   end
  # end

  root "patterns#index"
end
