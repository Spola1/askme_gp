class Hashtag < ApplicationRecord
  has_many :hashtag_links
  has_many :questions, through: :hashtag_links
end
