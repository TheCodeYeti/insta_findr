class Hashtag < ApplicationRecord
  has_many :instagram_post_hashtags
  has_many :instagram_posts, through: :instagram_post_hashtags
end
