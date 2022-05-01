class User < ApplicationRecord
  has_secure_password

  REGEX_NICKNAME = /\A[0-9a-z_]+\z/
  REGEX_COLOR = /\A#\h{3}{1,2}\z/

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :nickname, uniqueness: true, presence: true,
    length: { maximum: 40 }, format: { with: REGEX_NICKNAME }

  validates :color, format: { with: REGEX_COLOR }

  def downcase_nickname
    nickname.downcase!
  end
end
