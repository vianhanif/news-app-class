class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to current_user
  end
end
