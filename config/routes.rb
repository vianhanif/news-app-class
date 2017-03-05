Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#index'
  get 'search/:search', to:'pages#search'
  get 'latest_news', to: 'pages#news'
  get 'latest_videos', to: 'pages#videos'
  get ':year/:month/:date/:id', to: 'pages#read'
  resources :videos
  resources :articles
  resources :categories
end
