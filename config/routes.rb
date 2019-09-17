Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      get '/olympian_stats' => 'olympian_stats#index'
      get '/medal_count' => 'medal_count#index'

      resources :events, only: [:index]
      namespace :events do
        get '/:id/medalists' => 'medalists#show'
      end
    end
  end
end
