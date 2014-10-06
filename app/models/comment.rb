class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :hearts

  validates :text, presence: true
  validates :username, presence: true
  validates :post_id, presence: true

end
