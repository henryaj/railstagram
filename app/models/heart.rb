class Heart < ActiveRecord::Base
  belongs_to :comment
  has_one :user
end
