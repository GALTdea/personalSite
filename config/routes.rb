Rails.application.routes.draw do
  resources :topics, only: [:index, :show]


  #resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'pages#home'


  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tec_news', to: 'pages#tec_news'

  resources :portfolios, except: [:show] do
      put :sort, on: :collection
  end
  # the as: generates a url helper in this cas portolio_show_path
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'

  resources :blogs do
    member do
      get :toggle_status
    end
  end


  mount ActionCable.server => '/cable'


end
