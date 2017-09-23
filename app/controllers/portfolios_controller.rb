class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_porfolio, only: [:edit, :show, :update, :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all


  def index
     @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio = Portfolio.new
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
    render 'edit'
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
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]
                                      )
  end



end


