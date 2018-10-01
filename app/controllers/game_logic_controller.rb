class GameLogicController < ApplicationController
    def update_declared()
        @match = Match.find(params[:match_id])
        @match.update(declared: params[:declared] + 1, Phase: "Challenge1", target: params[:target])
        broadcast_to_match(@match)
    end

    def challenge_declared()
        @match = Match.find(params[:match_id])
        if params[:challenged] != true
            @challenger = User.find(params[:challenger_id])
            @current_player = User.find(@match.turn)
            #Development#
            puts @target.inspect
            puts @match.inspect
            #End Development#
            if (@current_player.handL != @match.declared || @current_player.activeL == false) && (@target.handR != @match.declared || @current_player.activeL == false)
                #TODO: Current_player loses a card
                @match.update(phase: "Remove", target: @match.turn)
            else
                #TODO: Challenger loses a card
                @match.update(phase: "Remove", target: @challenger.id)
            end
        else
            @match.update(phase: "Block")
        end
        broadcast_to_match(@match)
    end

    def block_challenge_declared()
        @match = Match.find(params[:match_id])
        if params[:challenged] != true
            @challenger = User.find(@match.turn)
            @blocker = User.find(@match.target)
            #Development#
            puts @target.inspect
            puts @match.inspect
            #End Development#
            if (@blocker.handL != params[:blocked_with] || @blocker.activeL == false ) && (@blocker.handR != params[:blocked_with] || @blocker.activeR == false )
                #TODO: Current_player loses a card
                @match.update(phase: "Remove", target: @match.turn)
            else
                #TODO: Challenger loses a card
                @match.update(phase: "Remove", target: @challenger.id)
            end
        else
            @match.update(phase: "Block")
        end
        broadcast_to_match(@match)
    end



    #-------------------------------------------------------#
    def income()
        @player = User.find(params[:player_id])
        @player.update(wallet: @player.wallet + 1)
    end

    def foreign_aid()
        @player = User.find(params[:player_id])
        @player.update(wallet: @player.wallet + 1)
    end

    def coup()
        @target = User.find(params[:target_id])
        #TODO: make coup logic
    end

    def remove_card()
        #params[:card_choosen]
        @match = Match.find(params[:match_id])
        @target = User.find(params[:target_id])
        @target.update("active#{params[:side]}": false)
        broadcast_to_match(@match)
    end

    def resolve
        #TODO: resolve
    end
end