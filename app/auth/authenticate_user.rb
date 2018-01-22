# frozen_string_literal: true

# app/auth/authenticate_user.rb
class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(admin_id: admin.id, type: 'MA') if admin
  end

  private

  attr_reader :email, :password

  # verify admin credentials
  def admin
    admin = Admin.find_by(email: email)
    return admin if admin &.authenticate(password)
    false
  end
end
