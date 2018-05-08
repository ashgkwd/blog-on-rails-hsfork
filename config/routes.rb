Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations/registrations' }
  get 'welcome/index'

  get '/articles/api' => 'articles#api' # or match for older Rails versions
  resources :articles
 
  resources :articles do
    resources :comments
  end
 
  root 'welcome#index'
end