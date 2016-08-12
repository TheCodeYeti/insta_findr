class RenameTagsToInstagramPosts < ActiveRecord::Migration[5.0]
  def change
    rename_table :tags, :instagram_posts
  end
end
