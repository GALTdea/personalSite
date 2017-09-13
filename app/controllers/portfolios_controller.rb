class PortfoliosController < ApplicationController
layout 'portfolio'
  def index
    @portfolios = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  #  def ruby_on_rails
  #   @portfolio = Portfolio.ruby_on_rails
  # end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build}
  end

  def create
    @portfolio = Portfolio.create(portfolio_params)
      if @portfolio.save
        redirect_to portfolios_path , notice: 'Your portfolio item is now live!'
      else
        render 'new'
      end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def edit
     @portfolio = Portfolio.find(params[:id])

  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to portfolio_show_path, notice: 'Your Portfolio item was updated'
      else
        render 'edit'
    end
  end


  def destroy
    @portfolio = Portfolio.find(params[:id])
      if @portfolio.destroy
         redirect_to portfolios_path, notice: 'Portfolio item deleted'
      end
  end




private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end

end


