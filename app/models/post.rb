class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_one_attached :image

  validates :airport_name, presence: true
  validates :sleep_space, length: { maximum: 200 }
  validates :others, length: { maximum: 500 }

  geocoded_by :airport_name
  after_validation :geocode, if: :airport_name_changed?

  def is_my_post(post_id, user_id)
    post = Post.find(post_id)
    if post.user_id == user_id
      return true
    else
      return false
    end
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def self.search(keyword)
    if keyword != ""
      Post.where(["airport_name like?", "%#{keyword}%"])
    else
      Post.all
    end
  end
end
