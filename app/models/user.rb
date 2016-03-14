class User < ActiveRecord::Base
  has_many :grumbles, dependent: :destroy
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

  class << self
    def set_user_ip
      Thread.current[:request].ip
    end

    def set_anonymous_digest
      user_ip = User.set_user_ip
      @anonymous_name = AnonymousHelper::Anonymous.name(user_ip)
      @anonymous_digest = AnonymousHelper::Anonymous.digest(@anonymous_name, 8)
    end
  end

  def cheered_count
    grumbles.joins(:cheers).count
  end

  def sympathied_count
    grumbles.joins(:sympathies).count
  end
end
