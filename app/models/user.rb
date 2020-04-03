class User < ApplicationRecord
  has_secure_password
  # validates_presence_of :userName, presence: true
  validates_presence_of :email, presence: true

  belongs_to :roll
  has_many :tasks, through: :user_tasks
  has_many :user_tasks, dependent: :destroy

  def can_modify_user?(user_id)
    roll_id == 1 || id.to_s == user_id.to_s
  end

  def is_admin?
    roll_id == 1
  end

end
