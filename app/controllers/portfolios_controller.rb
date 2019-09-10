class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.'}
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item has been edited' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end