Rails.application.routes.draw do
    get '/:id/join_game/', to: 'users#join_game'
    post '/gamelogic/update_declared/', to: "game_logic#update_declared"
    post '/gamelogic/challenge_declared/', to: "game_logic#challenge_declared"
    resources :users, only: [:index, :show, :create, :destroy]
    resources :matches, only: [:index, :show, :create]


    mount ActionCable.server => '/cable'
end
