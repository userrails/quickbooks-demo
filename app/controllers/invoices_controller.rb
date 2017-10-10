class InvoicesController < ApplicationController
  def index
    @invoices = Bill.all
  end

  def show
    @invoice = qbo_api.get(:invoice, params[:id])
  end

  def create
    invoice = {
      "Line": [
        {
          "Amount": 10001.00,
          "DetailType": "SalesItemLineDetail",
          "SalesItemLineDetail": {
            "ItemRef": {
              "value": "1",
              "name": "Services"
            }
          }
        }
      ],
      "CustomerRef": {
        "value": "1"
      }
    }

    res = qbo_api.create(:invoice, payload: invoice)
    Bill.create(billid: res['Id']) unless res['Id'].blank?
    redirect_to invoices_path, notice: 'Invoice created successfully!'
  end

  private

  def qbo_api
    QboApi.new(
      access_token: token.access_token,
      realm_id: token.realm_id
    )
  end
end
