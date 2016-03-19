class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :grumble, counter_cache: true
  validates :body, presence: true
end
