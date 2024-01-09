class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :task_user_ID, presence: true
  validates :task_content, presence: true, length: { maximum: 140 }
  validates :task_bet_user_ID, presence: true
end
