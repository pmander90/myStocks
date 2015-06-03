class StocksController < ApplicationController
  
  def index
    @profile = current_user.profile
    @stocks = []
    @profile.stocks.each do |stock|
      @stocks.push(symbol: stock)
    end
    render status: 200, json: @stocks.to_json
  end

  def create
    @stocks = current_user.profile.stocks
    @stocks.push(params[:stocks][:symbol])
      render json: @stocks.to_json, status: 200
  end

  # def update
  #   @reminder = Reminder.find(params[:id])
  #   if @reminder.update(reminder_params)
  #     render json: @reminder.to_json, status: 200
  #   end
  # end

  def destroy
    @stocks = current_user.profile.stocks
    @stocks.each do |stock|
      if stock == "fb"
        @stocks[i+1].delete
      end
    end
      render json: @stocks.to_json, status: 200
  end

end