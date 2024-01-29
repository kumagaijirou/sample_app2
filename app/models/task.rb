class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :content, presence: true, length: { maximum: 140 }
  validates :bet_user_id, presence: true, numericality: {only_integer: true}
  validates :amount_bet, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
