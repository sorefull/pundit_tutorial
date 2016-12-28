Rails.application.routes.draw do
  get '', to: 'statics#landing', as: 'landing'
  resources :posts
  devise_for :users
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
