Rails.application.routes.draw do
  root to: 'static#home'

  get '/blog' => 'posts#index', as: :blog

  resources :posts
end
