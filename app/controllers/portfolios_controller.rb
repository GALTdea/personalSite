class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_porfolio, only: [:edit, :show, :update, :destroy]

  def index
     @portfolio_items = Portfolio.all
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

  end

  def edit
  end

  def update

    if @portfolio.update(portfolio_params)
      redirect_to portfolio_show_path, notice: 'Your Portfolio item was updated'
      else
        render 'edit'
    end
  end


  def destroy

      if @portfolio.destroy
         redirect_to portfolios_path, notice: 'Portfolio item deleted'
      end
  end




private

  def set_porfolio
     @portfolio = Portfolio.find(params[:id])
  end


  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end



end


