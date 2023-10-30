class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  belongs_to :commentable, polymorphic: true
  has_many :replies, as: :commentable, class_name: "Reply"
  has_many :likes, as: :likeable, through: :commentable
end
