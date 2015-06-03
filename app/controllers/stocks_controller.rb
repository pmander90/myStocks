class StocksController < ApplicationController
  
  def index
    @stocks = current_user.stocks
    render status: 200, json: @stocks.to_json
  end

  def show
    @stock = Stock.find(params[:id])
    render status: 200, json: @stock.to_json
  end

  def create
    @stock = current_user.stocks.new(stock_params)
    if @stock.save
      render json: @stock.to_json, status: 200
    end
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      render json: @stock.to_json, status: 200
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.destroy
      render json: @stock.to_json, status: 200
    end
  end

  private
  def stock_params
    params.permit(:name, :symbol, :high, :low)
  end

end