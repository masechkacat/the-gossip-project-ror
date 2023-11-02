  Rails.application.routes.draw do
    root 'gossips#index'
    get '/', to: 'gossips#index'
    get '/team', to: 'static_pages#team'
    get '/contact', to: 'static_pages#contact'

    resources :gossips
    resources :users
    resources :sessions
    resources :gossips do
      resources :comments
    end

  end
