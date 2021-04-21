Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :buoys, only: [ :index, :show ]
      resources :data_buoys, only: [ :index, :show ]
      resources :spotters, only: [ :index, :show ]
      resources :waves, only: [ :index, :show ]
    end
  end
end
