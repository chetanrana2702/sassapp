# frozen_string_literal: true

# Model Class: Admin
class Admin < ApplicationRecord
  # encrypt password
  has_secure_password
  # validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    uniqueness: { case_sensetive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, confirmation: true,
                       length: { maximum: 30, minimum: 6 },
                       on: :create
  validates :password_confirmation, presence: true, on: :create
  
  # callbacks
  before_save { self.email = email.downcase }
end
