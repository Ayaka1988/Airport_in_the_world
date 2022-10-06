class Genre < ApplicationRecord
  #ancestryを有効にする
  has_ancestry
  has_many :posts
end
