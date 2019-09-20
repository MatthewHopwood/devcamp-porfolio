Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  # as: - this allows a custom path to be created, so the example would be 'portfolio_show_path(@portfolio_item)'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # get 'anything can go here' - this is the url path.
  # to: 'pages#about' - links the url path to the pages#show action.
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
