class RenameIdFieldInTags < ActiveRecord::Migration[5.0]
  def change
    change_column :tags, :instagram_id, :text
  end
end
