class Category < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
  has_many :tasks, :as => :taskable
end
