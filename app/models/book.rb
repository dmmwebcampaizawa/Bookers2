class Book < ApplicationRecord
  has_one_attached :profile_image, dependent: :destroy
  belongs_to :user

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 1, maximum: 200 }
  validates :category, presence: true


   #タグ検索、多数:多数
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  #検索方法、文字列のどの部分にでも検索したい文字列が含まれていればOK
  def self.search(keyword)
    @book = Book.where("category LIKE?","%#{keyword}%")
    # @book = Book.where("category LIKE?","#{keyword}") 完全一致
  end


end

