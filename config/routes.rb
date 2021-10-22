Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :buoys, only: [ :index, :show ]
      resources :data_buoys, only: [ :index, :show ]
      resources :spotters, only: [ :index, :show ]
      resources :waves, only: [ :index, :show ]
      resources :models, only: [ :index ]
      resources :bmo_raws, only: [ :index ]
      resources :stations, only: [ :index, :show ]
      resources :data_stations, only: [ :index ] do
        collection do
          get :last
          get :station
        end
      end
      resources :data_no_stations, only: [ :index, :show ]
    end
  end
end
