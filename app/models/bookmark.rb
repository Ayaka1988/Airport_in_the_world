class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates_uniqueness_of :post_id, scope: :user_id


  def self.bookmark_method(post, user)
      Bookmark.find_by(post_id: post.id, user_id: user.id)
  end
end