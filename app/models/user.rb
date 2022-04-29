class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid format. (example: user@gmail.com)" }
  validates :nickname, uniqueness: true, presence: true,
    length: { maximum: 40 }, format: { with: /\A[0-9A-Za-z_]+\z/,
    message: "Use letters of the Latin alphabet, numbers and underlining" }

  def downcase_nickname
    nickname.downcase!
  end
end
