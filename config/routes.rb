Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      get '/olympian_stats' => 'olympian_stats#index'
      resources :events, only: [:index]
      namespace :events do
        get '/:id/medalists' => 'medalists#show'
      end
    end
  end
end
