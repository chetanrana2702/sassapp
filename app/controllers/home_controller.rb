# frozen_string_literal: true

# Controller Class Home
# @reposibility - To show main app home page
class HomeController < ApplicationController
  layout 'home'

  def index
    @plans = Plan.all
    # [..]
  end
end
