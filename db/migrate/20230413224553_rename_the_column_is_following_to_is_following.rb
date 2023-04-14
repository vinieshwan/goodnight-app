class RenameTheColumnIsFollowingToIsFollowing < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :isFollowing, :is_following
    change_column :follows, :is_following, :boolean, using: 'is_following::boolean'
  end
end
