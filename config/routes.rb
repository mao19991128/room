Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  resources :users, only: [:show, :edit, :update]
  get '/mypage' => 'users#mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
