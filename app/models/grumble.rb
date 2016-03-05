class Grumble < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_many :cheers
  has_many :sympathies
  has_many :comments
  validates :body, presence: true, length: { maximum: 300 }
end
