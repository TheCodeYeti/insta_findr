class ChangeHashtagFieldInTags < ActiveRecord::Migration[5.0]
  def change
    change_column :tags, :hashtag, :text
  end
end
