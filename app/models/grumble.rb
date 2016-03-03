class Grumble < ActiveRecord::Base
  belongs_to :user
  has_many :cheers
  has_many :comments
  validates :body, presence: true, length: { maximum: 300 }
end
