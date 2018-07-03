Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  get 'posts/index'

  get 'posts/upload'
  post 'posts/create'

  get 'posts/delete/:post_id' => 'posts#delete'

  get 'posts/selection'

  get 'reacts/likes/:img_url/:post_id' => 'reacts#likes'
  get 'reacts/dislikes/:user_id/:post_id' => 'reacts#dislikes'

  get 'posts/myprofile'

  get 'posts/goodphoto'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
