class PurchaseOrdersController < ApplicationController
  def index
    @purchase_orders = qbo_api.all(:purchase_orders)
  end

  def show
    @purchase_order = qbo_api.get(:purchase_order, params[:id])
  end
end
