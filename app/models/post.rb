class Post < ApplicationRecord
  belongs_to genre, foreign_key: 'genre_id'
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :bookmarks, dependent: :destroy
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
end
