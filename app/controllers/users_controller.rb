class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        @new_user = User.new(name: params[:name])
        render self.query_result(@new_user)
    end

    def show
        begin
            @user = User.find(params[:id])
            render self.query_result(@user)
        rescue ActiveRecord::RecordNotFound
            render json: {error: "User #{params[:id]} does not exist"}, status: 400
        end
    end

    # TODO: YUCK, please refactor!
    def join_game
        begin
            @matches = Match.where("seats < 4")
            @user = User.find(params[:id])
            if @matches.empty? && @user.current_match === nil
                @match = Match.create(turn: @user.id)
                @match.user_matches.create(user_id: params[:id])
                @user.toggle_in_match(@match.id)
                draw_hand(@match, @user)
                render json: @match
            elsif @user.current_match === nil
                @match = @matches.all.first
                @match.user_matches.create(user_id: params[:id])
                @match.update(seats: @match.seats + 1)
                @user.toggle_in_match(@match.id)
                draw_hand(@match, @user)
                render json: @match
            else
                render json: {error: "User is already in a match"}, status: 400
            end
        rescue ActiveRecord::RecordNotFound
            render json: {error: "User #{params[:id]} does not exist"}, status: 400
        end
    end 

    def destroy
        begin
            @user = User.find(params[:id])
            @user.destroy
            render json: {deleted: "User #{params[:id]} was deleted"}, status: 200
        rescue ActiveRecord::RecordNotFound
            render json: {error: "User #{params[:id]} does not exist"}, status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
