class CampaignsController < ApplicationController

  respond_to :json

  def index
    @trades = Trade
                .by_user_id(params[:user_id])
                .by_trade_type(params[:trade_type])
    render json: @trades, status: :ok
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      render json: @trade, status: :ok
    else
      render json: @trade, status: :bad_request
    end
  end

  def show
    @trades = Trade.find(params[:id])
    if @trades.prenset?
      render json: @trade, status: :ok
    else
      render json: [], status: :not_found
    end
  end

  def update
    render status: :method_not_allowed
  end
  
  def delete
    render status: :method_not_allowed
  end

  private

  def trade_params
    params.require(:trade)
      .permit(:id, :trade_type, :user_id, :symbol, :shares, :price, :timestamp)
  end

end