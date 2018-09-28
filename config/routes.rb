Rails.application.routes.draw do
    resources :users, only: [:index, :show, :create, :destroy]
    resources :matches, only: [:index, :show, :create]

    get '/:id/join_game', to: 'users#join_game'

    mount ActionCable.server => '/cable'
end
