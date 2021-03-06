class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :hashtag_links, dependent: :destroy
  has_many :hashtags, through: :hashtag_links

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :update_hashtags

  def update_hashtags
    self.hashtags =
      question_hashtags.map { |tag| Hashtag.create_or_find_by(text: tag.delete('#')) }
  end

  private

  def question_hashtags
    question_text = "#{body} #{answer}"
    get_string_hashtags(question_text.downcase).uniq
  end

  def get_string_hashtags(str)
    str.scan(Hashtag::VALID_HASHTAG_REGEX)
  end
end
