class User < ApplicationRecord
  extend FriendlyId
  friendly_id :nickname, use: :slugged

  REGEX_NICKNAME = /\A[0-9a-z_]+\z/
  REGEX_COLOR = /\A#\h{3}{1,2}\z/

  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, uniqueness: true, presence: true,
    length: { maximum: 40 }, format: { with: REGEX_NICKNAME }
  validates :color, format: { with: REGEX_COLOR }

  has_many :questions, dependent: :delete_all

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def downcase_nickname
    nickname.downcase!
  end
end
