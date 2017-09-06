Rails.application.routes.draw do
  root to: 'pages#home'


  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :portfolios, except: [:show]
  # the as: generates a url helper in this cas portolio_show_path
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

end
