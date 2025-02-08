class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  has_secure_password
end
