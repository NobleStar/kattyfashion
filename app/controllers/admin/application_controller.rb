class Admin::ApplicationController < ActionController::Base
  # before_filter :authenticate!
  layout "admin/layouts/admin.html.erb"

  def authenticate!
    redirect_to admin_login_path if !user_signed_in?
  end
end
