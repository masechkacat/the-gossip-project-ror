  Rails.application.routes.draw do
    root 'gossips#index'
    get '/', to: 'gossips#index'
    get '/team', to: 'static_pages#team'
    get '/contact', to: 'static_pages#contact'
    #get '/welcome/:first_name', to: 'welcome#show'
    
    resources :gossips
  end
