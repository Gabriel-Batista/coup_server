class MatchSerializer < ActiveModel::Serializer
    attributes :id, :seats, :phase, :turn, :declared 
end
