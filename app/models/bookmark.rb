class Bookmark <
  validates :user_id, uniqueness: { scope: :post_id }
end
