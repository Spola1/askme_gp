class Hashtag < ApplicationRecord
  extend FriendlyId

  has_many :hashtag_links, dependent: :destroy
  has_many :questions, through: :hashtag_links

  validates :text, presence: true

  friendly_id :text, use: :slugged
end
