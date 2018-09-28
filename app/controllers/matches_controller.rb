class MatchesController < ApplicationController
    # def index
    #     match = Match.all.first
    #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #         MatchSerializer.new(match)
    #     ).serializable_hash
    #     ActionCable.server.broadcast "match_channel", serialized_data
    #     head :ok
    # end
    def index
        match = Match.find(params[:match_id])
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MatchSerializer.new(match)
        ).serializable_hash
        MatchChannel.broadcast_to match, serialized_data
        head :ok
    end

    def show
        match = Match.find(params[:id])
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MatchSerializer.new(match)
        ).serializable_hash
        MatchChannel.broadcast_to match, serialized_data
        head :ok
    end

    # def create
    #     match = Match.new(match_params)
    #     if match.save
    #         serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #             MatchSerializer.new(match)
    #         ).serializable_hash
    #         MatchChannel.broadcast_to match, serialized_data
    #     end
    # end
    
    private
    
    def match_params
        params.require(:match).permit(:completed, :seats)
    end
end
