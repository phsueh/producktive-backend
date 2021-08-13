class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :status_complete, :category_id
end
