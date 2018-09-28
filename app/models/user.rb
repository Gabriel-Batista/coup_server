class User < ApplicationRecord
    has_many :user_matches
    has_many :matches, through: :user_matches

            def toggle_in_match(match_id)
            begin
                self.update(currentMatch: match_id)
            rescue ActiveRecord::RecordNotFound
                render json: {error: "User #{self.id} does not exist"}, status: 400
            end
        end
end
