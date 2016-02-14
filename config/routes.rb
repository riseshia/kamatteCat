Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :repositories do
    post :sync, on: :collection
    post :switch, on: :member
  end

  root 'home#index'
end
