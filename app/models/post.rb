class Post < ApplicationRecord
  has_one_attached :image
  has_one_attached :file
  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true
  # validates :image, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes, message: 'is too large' }
  validates :image , content_type: ['image/png', 'image/jpeg'], size: {less_than: 5.megabytes, message: 'is too large'}

  def thumbnail
    return self.image.variant(resize_to_limit: [300, 300]).processed if self.image.attached?
  end
end
