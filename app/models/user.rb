class User < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :goals, through: :categories
    has_many :tasks, dependent: :destroy

    has_secure_password
    validates :username, uniqueness: true

end
