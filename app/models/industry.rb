class Industry < ApplicationRecord

  has_many :posts

  validates :industry, presence: true, length:{minimum:2, maximum:30}

end
