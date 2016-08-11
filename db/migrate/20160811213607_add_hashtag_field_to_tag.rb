class AddHashtagFieldToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :hashtag, :integer
  end
end
