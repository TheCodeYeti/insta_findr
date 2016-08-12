class RenameTagsToInstagramPosts < ActiveRecord::Migration[5.0]
  class RenameCorpsToStores < ActiveRecord::Migration
  def change
    rename_table :tags, :instagram_posts
  end
end
end
