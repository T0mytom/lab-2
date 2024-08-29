class Comment < ApplicationRecord
  belongs_to :post

  validates :content, :author, presence: true
  validate :author_exists

  def author_exists
    errors.add(:author, "must be a valid email") unless User.exists?(email: author)
  end
end
