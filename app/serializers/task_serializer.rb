class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :priority, :difficulty, :start_date, :end_date, :status_complete, :duration, :user_id
  has_one :taskable
end
