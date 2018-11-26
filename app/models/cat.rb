class Cat < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates :image, presence: true, file_size: { less_than: 1.megabytes }
end
