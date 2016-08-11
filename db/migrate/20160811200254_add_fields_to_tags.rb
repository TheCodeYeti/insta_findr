class AddFieldsToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :instagram_id, :integer
    add_column :tags, :created_time, :datetime
    add_column :tags, :username, :string
    add_column :tags, :link, :string
    add_column :tags, :photo, :string
    add_column :tags, :video, :string
  end
end
