class CreateGrumbles < ActiveRecord::Migration
  def change
    create_table :grumbles do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
