class LikeDislike < ApplicationRecord
  belongs_to :user
  belongs_to :like_dislike_model, polymorphic: true
end
