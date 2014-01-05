class Admin::DashboardController < Admin::ApplicationController

  def show
    @reviews = Review.all.order("created_at DESC").limit(5)
    @excerpt = true
  end

end
