class InvoicesController < ApplicationController
  def index
    @invoices = qbo_api.get(:invoice)
  end

  def create
    invoice = {
      "Line": [
        {
          "Amount": 100.00,
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

    qbo_api.create(:invoice, payload: invoice)

    redirect_to invoices_path
  end

  private

  def qbo_api
    QboApi.new(
      access_token: token.access_token,
      realm_id: token.realm_id
    )
  end
end
