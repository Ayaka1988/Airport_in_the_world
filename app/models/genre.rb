class Genre < ApplicationRecord
  #ancestryを有効にする
  has_ancestry
  # has_many :post_genres
  has_many :posts

  def self.genre_parent_array_create
    #親カテゴリーのセレクトボックスを作成→初期値格納
    genre_parent_array = ['---']
    Genre.where(ancestry: nil).each do |parent|
    genre_parent_array << [parent.name, parent.id]
    end
  return genre_parent_array
  end
end
