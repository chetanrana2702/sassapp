# frozen_string_literal: true

# []
module Tenants
  # [..]
  module Validations
    extend ActiveSupport::Concern
    included do
      # Validations
      validates :category, presence: true

      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true,
                        length: { maximum: 255 },
                        uniqueness: { case_sensitive: false },
                        format: { with: VALID_EMAIL_REGEX }

      validates :password, confirmation: true,
                           length: { maximum: 30, minimum: 6 },
                           on: :create

      validates :password_confirmation, presence: true,
                                        on: :create

      VALID_SUBDOMAIN_REGEX = /\A\d*[a-z][a-z\d]*\z/
      validates :subdomain, uniqueness: true,
                            length: { maximum: 50, minimum: 2 },
                            exclusion: {
                              in: %w[www us ca jp com in net org io],
                              message: "%{value} is reserved."
                            },
                            format: { with: VALID_SUBDOMAIN_REGEX }
    end
  end
end
