class User < ActiveRecord::Base
  has_many :grumbles
  has_many :cheers
  has_many :sympathies
  has_many :comments
  has_many :cheer_grumbles, through: :cheers, source: :grumble
  has_many :sympathy_grumbles, through: :sympathies, source: :grumble
  has_many :comment_grumbles, -> { uniq }, through: :comments, source: :grumble
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
