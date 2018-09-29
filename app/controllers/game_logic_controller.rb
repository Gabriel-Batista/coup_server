class GameLogicController < ApplicationController
    def start()
        @match = Match.find(params[:id])
        
    end
end