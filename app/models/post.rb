class Post < ApplicationRecord

  belongs_to :user
  belongs_to :industry
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :answer_what,              presence: true, length:{maximum:200}
  validates :answer_employment_status, presence: true, length:{maximum:200}
  validates :answer_working_style,     presence: true, length:{maximum:200}
  validates :answer_income,            presence: true, length:{maximum:200}
  validates :answer_how,               presence: true, length:{maximum:200}
  validates :answer_skill,             presence: true, length:{maximum:200}
  validates :answer_why,               presence: true, length:{maximum:200}
  validates :answer_aptitude,          presence: true, length:{maximum:200}
  validates :answer_future,            presence: true, length:{maximum:200}
  validates :answer_advantage,         presence: true, length:{maximum:200}
  validates :answer_free,              presence: true, length:{maximum:200}

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
