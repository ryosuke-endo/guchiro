class AddAnonymousDigestToComments < ActiveRecord::Migration
  def change
    add_column :comments, :anonymous_digest, :string
  end
end
