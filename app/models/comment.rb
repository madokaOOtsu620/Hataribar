class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  validates :comment, presense: true, length:{maximum:200}

end
