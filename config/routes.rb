  Rails.application.routes.draw do
    root 'static_pages#home'
    get '/', to: 'static_pages#home'
    get '/home', to: 'static_pages#home'
    get '/team', to: 'static_pages#team'
    get '/contact', to: 'static_pages#contact'
    get '/gossip/:id', to: 'dynamic_pages#gossip', as: 'gossip'
  end
