class Book < ApplicationRecord
  has_one_attached :profile_image, dependent: :destroy
  belongs_to :user

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 1, maximum: 200 }

end

