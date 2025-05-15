class User < ApplicationRecord
  before_save { self.email= email.downcase } # can also use before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
    format: { with: Settings.valid_email_regex }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
