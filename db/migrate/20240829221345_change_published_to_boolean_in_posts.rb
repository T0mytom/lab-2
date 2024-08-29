class ChangePublishedToBooleanInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :published, :boolean, default: false, null: false
  end
end
