class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video
  has_many :like_dislikes, as: :like_dislike_model
end
