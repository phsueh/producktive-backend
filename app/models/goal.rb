class Goal < ApplicationRecord
  belongs_to :category
  has_many :tasks, as: :taskable
end
