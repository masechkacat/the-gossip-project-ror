class Gossip < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :gossip_tags
    has_many :tags, through: :gossip_tags
    has_many :likes, as: :likeable
end
