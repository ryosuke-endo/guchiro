class Cheer < ActiveRecord::Base
  belongs_to :user
  belongs_to :grumble

  class << self
    def cheered_by_user?(user, grumble)
      Cheer.where(user_id: user.id, grumble_id: grumble.id).exists?
    end
  end
end
