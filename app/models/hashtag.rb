class Hashtag < ApplicationRecord
  extend FriendlyId

  has_many :hashtag_links
  has_many :questions, through: :hashtag_links

  validates :text, presence: true

  scope :with_questions, lambda {
                           left_joins(:hashtag_links)
                             .where.not(hashtag_links: { question_id: nil })
                             .distinct
                             .order(created_at: :desc)
                         }

  friendly_id :text, use: :slugged
end
