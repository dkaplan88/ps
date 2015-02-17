Rails.application.routes.draw do
  root to: 'static#home'

  get '/blog' => 'posts#index', as: :blog
  get '/resume' => 'static#resume', as: :resume

  scope '/blog' do
    resources :posts
    resources :tags, only: [:show]
  end
end
