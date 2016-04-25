class DashboardsController < ApplicationController
  before_action :require_login

  def show
    user = User.find_by(username: params[:username])
    if user != current_user
      redirect_to root_url
    end
  end
end
