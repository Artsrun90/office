class Task < ApplicationRecord
    belongs_to :project
    has_many :users, through: :user_tasks
    has_many :user_tasks

end
