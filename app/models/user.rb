class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, uniqueness: true, presence: true,
    length: { maximum: 40 }, format: { with: /\A[0-9a-z_]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
