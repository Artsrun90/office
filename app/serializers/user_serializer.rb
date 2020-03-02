class UserSerializer < ActiveModel::Serializer
  attributes :id, :userName, :email, :gender
end
