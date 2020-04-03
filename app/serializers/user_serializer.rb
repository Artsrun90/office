class UserSerializer < ActiveModel::Serializer
  attributes :id, :userName, :email, :roll_id, :date_Of_Birth, :gender, :login
end
