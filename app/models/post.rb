class Post < ApplicationRecord

  belongs_to :user
  belongs_to :industry
  has_many :bookmark, dependent: :destroy
  has_many :comment, dependent: :destroy

end
