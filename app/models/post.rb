class Post < ApplicationRecord
  # Validations
  validates :title, :content, :published, :author, presence: true
  validates :content, length: { minimum: 140 }
  validates :title, length: { maximum: 100 }
  validates :published, inclusion: { in: %w[unpublished published] }
  validate :author_exists


  # Enum
  enum published: { unpublished: 0, published: 1 }

  # Associations
  has_many :comments, dependent: :destroy

  private

  def author_exists
    errors.add(:author, "must be a valid email") unless User.exists?(email: author)
  end
end
