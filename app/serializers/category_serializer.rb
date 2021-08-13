class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :duration
  has_many :goals
end
