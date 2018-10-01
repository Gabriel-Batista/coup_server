class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :handL, :handR, :wallet, :activeL, :activeR
end
