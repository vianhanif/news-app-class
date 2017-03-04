Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'
  get 'tags/:tag', to: 'articles#index', as: :tag
  resources :videos
  resources :articles
  resources :categories
end
