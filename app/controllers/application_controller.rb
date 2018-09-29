class ApplicationController < ActionController::API

    def query_result(instance)
        if instance.save
            {json: instance, status: 200}
        else
            {json: self.render_errors(instance), status: 400}
        end
    end

    def render_errors(instance)
        errors_hash = {}
        instance.errors.full_messages.each_with_index do |error|
            errors_hash[index] = error
        end
        errors_hash
    end

    def broadcast_to_match(match)
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MatchSerializer.new(match)
        ).serializable_hash
        ActionCable.server.broadcast "match#{match.id}", serialized_data
    end

end
