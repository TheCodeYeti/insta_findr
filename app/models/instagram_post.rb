class InstagramPost < ApplicationRecord
  has_many :instagram_post_hashtags
  has_many :hashtags, through: :instagram_post_hashtags
end
