class Sympathy < ActiveRecord::Base
  belongs_to :user
  belongs_to :grumble

  class << self
    def sympathied_by_user?(user, grumble)
      Sympathy.where(user_id: user.id, grumble_id: grumble.id).exists?
    end
  end
end
