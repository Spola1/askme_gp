class Hashtag < ApplicationRecord
  VALID_HASHTAG_REGEX = /#[[:word:]-]+/

  extend FriendlyId

  has_many :hashtag_links, dependent: :destroy
  has_many :questions, through: :hashtag_links

  validates :text, presence: true

  friendly_id :text, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.transliterate(:russian).normalize.to_s
  end
end
