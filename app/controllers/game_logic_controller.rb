class GameLogicController < ApplicationController
    def update_declared()
        @match = Match.find(params[:match_id])
        @match.update(declared: params[:declared] + 1, phase: 1, target: params[:target])
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
                index_of_next_player = @match.users.map(&:id).index(@match.turn) + 1
                @match.update(phase: 0, target: @match.turn, turn: @match.users[index_of_next_player].id)
            else
                #TODO: Challenger loses a card
                @match.update(phase: 2, target: @challenger.id)
            end
        else
            @match.update(phase: 3)
        end
        broadcast_to_match(@match)
    end

    def block_challenge_declared()
        @match = Match.find(params[:match_id])
        if params[:challenged] != true
            @challenger = User.find(@match.turn)
            @blocker = User.find(@match.target)
            if (@blocker.handL != params[:blocked_with] || @blocker.activeL == false ) && (@blocker.handR != params[:blocked_with] || @blocker.activeR == false )
                # if blocker was lying
                @match.update(phase: 5, target: @match.turn)
            else
                # if blocker WASNT lying
                index_of_next_player = @match.users.map(&:id).index(@match.turn) + 1
                @match.update(phase: 0, target: @match.turn, turn: @match.users[index_of_next_player].id)
            end
        else
            @match.update(phase: 6)
        end
        broadcast_to_match(@match)
    end

    def resolve()
        @match = Match.find(params[:match_id])
        @ability = Card.find(@match.declared).ability

        if @ability == "bank"
            self.bank(@match)
        elsif @ability == "assassinate"
            self.assassinate(@match)
        elsif @ability == "steal"
            self.steal(@match)
        elsif @ability == "draw"
            self.draw(@match)
        elsif @ability == "income"
            self.income(@match)
        elsif @ability == "foreign_aid"
            self.foreign_aid(@match)
        elsif @ability == "coup"
            self.coup(@match)
        end
    end

    #-------------------------------------------------------#

    def remove_card()
        #params[:card_choosen]
        @match = Match.find(params[:match_id])
        @target = User.find(params[:target_id])
        @target.update("active#{params[:side]}": false)
        @match.update(phase: @match.phase + 1)
        broadcast_to_match(@match)
    end

    def bank(match)
        @player = User.find(match.turn)
        @player.wallet += 3
    end

    def assassinate(match)
        match.update(phase: match.phase + 1)
    end

    def steal(match)
        @target = User.find(match.target)
        @player = User.find(match.turn)
    end

    def draw(match)
        # draw 2 from deck, keep one
    end

    def income(match)
        @player = User.find(params[:player_id])
        @player.update(wallet: @player.wallet + 1)
    end

    def foreign_aid(match)
        @player = User.find(params[:player_id])
        @player.update(wallet: @player.wallet + 2)
    end

    def coup(match)
        match.update(phase: match.phase + 1)
    end
end