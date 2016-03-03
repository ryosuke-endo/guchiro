class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :grumble
  validates :body, presence: true
end
