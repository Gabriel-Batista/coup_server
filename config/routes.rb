Rails.application.routes.draw do
    get '/:id/join_game/', to: 'users#join_game'
    resources :users, only: [:index, :show, :create, :destroy]
    resources :matches, only: [:index, :show, :create]


    mount ActionCable.server => '/cable'
end
