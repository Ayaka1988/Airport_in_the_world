class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # has_many :post_genres
  # has_many :genres, through: :post_genres
  has_one_attached :image

  validates :airport_name, presence: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match" #完全一致
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match" #部分一致
      @post = Post.where("title LIKE?","#{word}")
    else
      @post = Post.all
    end
  end
end
