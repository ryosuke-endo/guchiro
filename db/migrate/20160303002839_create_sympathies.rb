class CreateSympathies < ActiveRecord::Migration
  def change
    create_table :sympathies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :grumble, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
