Devise.secret_key = "93c5c2a71b092622fc6763ee62caf93797ccb7aa8a6df6a0349b20d5cd4077383c5737fb35737b48979dde545c1da8b74db2"

Devise.setup do |config|
  # Required so users don't lose their carts when they need to confirm.
  config.allow_unconfirmed_access_for = 1.days

  # Fixes the bug where Confirmation errors result in a broken page.
  config.router_name = :spree

  # Add any other devise configurations here, as they will override the defaults provided by spree_auth_devise.
end