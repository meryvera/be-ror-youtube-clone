class Video < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :like_dislikes, as: :like_dislike_model
end
