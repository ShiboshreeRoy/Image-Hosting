class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :file, presence: true
end
