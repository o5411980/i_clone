class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
  belongs_to :user
end
