class Admin::PortfoliosController < Admin::ApplicationController
  respond_to :json, only: [:create, :update, :destory]
  
  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :description))
    if @portfolio.save
      respond_with(@portfolio, :status => 201, :default_template => :show)
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end  

  def index
    @portfolios = Portfolio.all
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(params.require(:portfolio).permit(:title, :description))
      respond_with(@portfolio, :status => 201, :default_template => :show)
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end  
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to admin_portfolios_path

  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @image = Image.new
  end

  def new 
    @portfolio = Portfolio.new
    @image = Image.new
  end

end
