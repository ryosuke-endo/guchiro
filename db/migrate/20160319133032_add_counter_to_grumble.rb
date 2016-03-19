class AddCounterToGrumble < ActiveRecord::Migration
  def change
    add_column :grumbles, :cheers_count, :integer, default: 0
    add_column :grumbles, :sympathies_count, :integer, default: 0
    add_column :grumbles, :comments_count, :integer, default: 0
  end
end
