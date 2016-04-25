class SessionsController < Clearance::SessionsController

  private
    def url_after_create
      dashboard_url current_user.username
    end
end
