Rails.application.routes.draw do
  devise_for :admins

  root to: 'static#home'

  get '/about'      => 'static#about',      as: :about
  get '/where_am_i' => 'static#where_am_i', as: :where_am_i
  get '/resume'     => 'static#resume',     as: :resume
  get '/blog'       => 'posts#index',       as: :blog
  get '/countries'  => 'static#countries',  as: :countries

  scope '/blog' do
    resources :posts
    resources :tags, only: [:show, :index]
  end
end
