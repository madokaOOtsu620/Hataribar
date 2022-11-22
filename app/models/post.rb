class Post < ApplicationRecord

  belongs_to :user
  belongs_to :industry
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 投稿の仕事内容カラムを範囲とし、キーワード検索をかけられる
  # キーワードが入力されない場合は投稿一覧が表示される
  def self.search(search)
    if search != ""
      Post.where(['answer_what LIKE(?)', "%#{search}%"])
    else
      Post.all
    end
  end

  # ブックマークメソッド
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

end
