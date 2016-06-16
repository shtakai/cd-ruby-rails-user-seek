class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :secret, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
