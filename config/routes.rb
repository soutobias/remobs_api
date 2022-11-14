Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :buoys, only: [ :index, :show ]
      resources :data_tides, only: [ :index, :show ]
      resources :data_buoys, only: [ :index, :show ]
      resources :spotters, only: [ :index, :show ]
      resources :waves, only: [ :index, :show ]
      resources :models, only: [ :index ]
      resources :bmo_raws, only: [ :index ]
      resources :stations, only: [ :index, :show ]
      resources :weather_warnings, only: [ :index ]
      resources :data_stations, only: [ :index ] do
        collection do
          get :last
          get :station
          get :distinct
        end
      end
      resources :data_no_stations, only: [ :index ] do
        collection do
          get :distinct
        end
      end
      resources :tags, only: [ :index ]
    end
    namespace :v2 do
      resources :moored_buoys, only: [ :index, :show ]
      resources :qualified_values, only: [ :index, :show ]
      resources :drift_buoys, only: [ :index, :show ]
      resources :drift_values, only: [ :index, :show ] do
        collection do
          get :last
        end
      end
      resources :drift_waves, only: [ :index, :show ]
    end
  end
end
