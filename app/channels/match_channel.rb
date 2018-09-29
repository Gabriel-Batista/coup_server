class MatchChannel < ApplicationCable::Channel
#   def subscribed
#     match = Match.find(1)
#     stream_from "match_channel"
#   end
  def subscribed
    match = Match.find(params[:id])
    stream_from "match#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
