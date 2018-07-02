Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  get 'posts/index'

  get 'posts/upload'
  post 'posts/create'

  get 'posts/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
