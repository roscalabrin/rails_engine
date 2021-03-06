class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def index
    total_date_revenue = Merchant.total_revenue_by_date(params[:date])
    respond_with total_date_revenue, serializer: MerchantTotalRevenueSerializer
  end

  def show
    if params[:date]
      date_revenue = Merchant.find(params[:id]).revenue_by_date(params[:date])
      respond_with date_revenue, serializer: MerchantRevenueSerializer
    else
      merchant_revenue = Merchant.find(params[:id]).revenue
      respond_with merchant_revenue, serializer: MerchantRevenueSerializer
    end
  end
end
