class Post < ApplicationRecord

  belongs_to :user
  belongs_to :industry
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :answer_what, :answer_employment_status, :answer_working_style,
    :answer_income, :answer_how, :answer_skill
  end

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
    bookmarks.where(user_id: user).exists?
  end

end