# coding: utf-8
class ReviewsController < InheritedResources::Base

  respond_to :html, :json

  def create
    @review = Review.new(permitted_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path, notice: "Thank you!" }
        format.json { render json: { status: true, message: "Спасибо за ваш отзыв!" } }
      else

      end
    end
  end

  def index
    @reviews = Review.where(approved: true).page(params[:page]).per(5)
  end

  private
    def permitted_params
      params.require(:review).permit(:name, :email, :text)
    end
end
