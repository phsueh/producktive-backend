class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :quote, :tasks
  has_many :categories
end
