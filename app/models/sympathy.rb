class Sympathy < ActiveRecord::Base
  belongs_to :user
  belongs_to :grumble, counter_cache: true
end
