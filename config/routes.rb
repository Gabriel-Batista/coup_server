Rails.application.routes.draw do
    resources :users, only: [:index, :create]
    resources :matches, only: [:index, :show, :create]
    mount ActionCable.server => '/cable'
end
