class AddAnonymousDigestToGrumbles < ActiveRecord::Migration
  def change
    add_column :grumbles, :anonymous_digest, :string
  end
end
