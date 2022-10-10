class PostGenre < ApplicationRecord
  belongs_to :post
  belongs_to :genre

  #コントローラーから引数を4つ受け取る
  def self.maltilevel_genre_create(post, parent_id, children_id, grandchildren_id)
    #親カテゴリーのIDを引数として受け取れた場合 && 初期値でない場合処理を実行
    if parent_id.present? && parent_id != '---'
      genre = Genre.find(parent_id)
      #PostGenre(中間テーブル)にレコードを作成
      PostGenre.create(post_id: post.id, genre_id: genre.id)
    end


    if children_id.present? && children_id != '---'
      genre = Genre.find(children_id)
      PostGenre.create(post_id: post.id, genre_id: genre.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      genre = Genre.find(grandchildren_id)
      PostGenre.create(post_id: post.id, genre_id: genre.id)
    end
  end
end
