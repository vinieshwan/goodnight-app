class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false, index: true
      t.integer :followee_id, null: false
      t.boolean :isFollowing, null: false

      t.timestamps
    end
  end
end
