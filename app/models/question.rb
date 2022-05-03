class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :body, presence: true, length: { maximum: 280 }
end
