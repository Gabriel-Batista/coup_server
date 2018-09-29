class GameLogicController < ApplicationController
    def start()
        @match = Match.find(params[:id])
    end

    def update_declared()
        @match = Match.find(params[:id])
        @match.update(declared: params[:declared])
        broadcast_to_match(@match)
    end

end