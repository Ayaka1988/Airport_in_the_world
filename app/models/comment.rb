class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

   validates :reply, presence: true, length: { maximum: 150 }

end
