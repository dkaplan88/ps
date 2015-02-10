Rails.application.routes.draw do
  root to: 'static#home'

  get '/blog' => 'posts#index', as: :blog

  scope '/blog' do
    resources :posts
    resources :tags, only: [:show]
  end
end
