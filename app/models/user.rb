class User < ActiveRecord::Base
  has_many :grumbles
  has_many :cheers
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
