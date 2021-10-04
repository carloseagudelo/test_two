class TradesController < ApplicationController

  def index
    @trades = Trade
                .order(:id)  
                &.by_user_id(params[:user_id])
                &.by_trade_type(params[:trade_type])
                
    render json: @trades, status: :ok
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      render json: @trade, status: :created
    else
      render json: { status: 400 }, status: :bad_request
    end
  end

  def show
    @trades = Trade.where(id: params[:id])
    if @trades.present?
      render json: @trades.first, status: :ok
    else
      render status: :not_found
    end
  end

  def update
    render json: { status: 405 }, status: :method_not_allowed
  end
  
  def delete
    render json: { status: 405 }, status: :method_not_allowed
  end

  private

  def trade_params
    params.permit(:id, :trade_type, :user_id, :symbol, :shares, :price, :timestamp)
  end

end