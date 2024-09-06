class Comment < ApplicationRecord
  # Validations
  validates :content, presence: true
  validates :user_id, presence: true
  validate :user_exists

  # Associations
  belongs_to :post
  belongs_to :user

  def user_exists
    errors.add(:user_id, "must be a valid user") unless User.exists?(user_id)
  end

  def author_name
    user ? "#{user.first_name} #{user.last_name}" : "Unknown"
  end
end
