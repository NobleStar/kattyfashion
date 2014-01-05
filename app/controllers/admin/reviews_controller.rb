# conding: utf-8
class Admin::ReviewsController < Admin::ApplicationController

  respond_to :html, :json

  def index
    @reviews = Review.order("created_at DESC").page(params[:page]).per(5)
  end

  def approve
    review = Review.update(params[:id], approved: true)
    respond_to do |format|
      format.json { render json: { status: true }  }
    end
  end

  def disapprove
    review = Review.update(params[:id], approved: false)
    puts review.inspect
    respond_to do |format|
      format.json { render json: { status: true }  }
    end
  end

  def delete
    begin
      affected_rows = Review.delete(params[:id])
      respond_to do |format|
        format.json { render json: { status: true } }
      end
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.json { render json: { status: true } }
      end
    rescue Exception => msg
      respond_to do |format|
        format.json { render json: { status: false, message: msg.backtrace.inspect } }
      end
    end
  end

  private
    def review_params
      params.require(:review).permit(:approved)
    end
end
