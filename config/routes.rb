Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  get 'users', to: 'admin#index'
  get    'sign_up',  to: 'users#sign_up'
  post   'sign_up',  to: 'users#sign_up_create'
  get    'log_in',   to: 'sessions#new'
  post   'log_in',   to: 'sessions#create'
  delete 'log_out',  to: 'sessions#destroy'
  get 'approve/:id', to: 'users#approve'
  resources :users
  resources :roles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#index'
  get 'lookup', to:'pages#search'
  get 'latest_news', to: 'pages#news'
  get 'latest_videos', to: 'pages#videos'
  get 'article/:year/:month/:date/:slug', to: 'pages#read_article'
  get 'watch/:slug', to: 'pages#watch'
  get 'latest_agendas', to: 'pages#agendas'
  get 'agenda/:year/:month/:date/:slug', to: 'pages#read_agenda'
  get 'pick/:id', to: 'articles#pick'
  resources :videos
  resources :articles
  resources :categories
  resources :agendas
end
