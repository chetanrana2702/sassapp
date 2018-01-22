# frozen_string_literal: true

# Module Mainauthority with Class Dashboard
# @responsibility From here Main admin
# can manage tenants, manage categories etc ..
module Mainauthority
  # Controller Class: Dashboard
  class DashboardController < ApplicationController
    layout 'dashboard'
  end
end
