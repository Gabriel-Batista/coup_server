class MatchSerializer < ActiveModel::Serializer
    attributes :id, :seats, :phase, :turn, :declared
    has_many :users
end
