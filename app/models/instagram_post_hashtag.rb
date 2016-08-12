class InstagramPostHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :instagram_post
end
