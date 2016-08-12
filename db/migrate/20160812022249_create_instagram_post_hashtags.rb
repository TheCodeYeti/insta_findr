class CreateInstagramPostHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :instagram_post_hashtags do |t|
      t.belongs_to :hashtag, foreign_key: true
      t.belongs_to :instagram_post, foreign_key: true

      t.timestamps
    end
  end
end
