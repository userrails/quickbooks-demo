class PurchaseOrdersController < ApplicationController
  def index
    @purchase_orders = case params[:status]
                       when 'Open'
                         qbo_api.query(
                           "SELECT * FROM PurchaseOrder WHERE POStatus=Open"
                         )
                       when 'Closed'
                         qbo_api.query(
                           "SELECT * FROM PurchaseOrder WHERE POStatus=Closed"
                         )
                       else
                         qbo_api.all(:purchase_orders)
                       end
  end

  def show
    @purchase_order = qbo_api.get(:purchase_order, params[:id])
  end
end
