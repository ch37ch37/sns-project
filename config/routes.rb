Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, except: [:show] do
    post "/like", to: "likes#like_toggle"
    resources :comments, only:[:create, :destroy]
  end
  get 'mypage/index'
  resources :follows, only: [:create, :destroy]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
