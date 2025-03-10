class User < ApplicationRecord
  has_many(:products, dependent: :destroy)
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :password, length: { minimum: 6 }

  has_secure_password
end
