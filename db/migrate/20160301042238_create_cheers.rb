class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :grumble, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
