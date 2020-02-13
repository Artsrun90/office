class User < ApplicationRecord
  belongs_to :roll
  has_many :tasks, through: :user_tasks

  has_many :user_tasks

end
