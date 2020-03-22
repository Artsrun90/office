class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :userName, :email, :roll_id, :date_Of_Birth, :gender
end
