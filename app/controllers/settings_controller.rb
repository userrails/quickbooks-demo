class SettingsController < ApplicationController
  def authenticate
    callback = oauth_callback_vendors_url
    token = $qb_oauth_consumer.get_request_token(:oauth_callback => callback)
    session[:qb_request_token] = Marshal.dump(token) # for rails >= 4.1 we need Marshal.dump()

    redirect_to("https://appcenter.intuit.com/Connect/Begin?oauth_token=#{token.token}") and return
  end

  # callback
  def oauth_callback
    at = Marshal.load(session[:qb_request_token]).get_access_token(
      oauth_verifier: params[:oauth_verifier]
    )

    session[:token] = at.token
    session[:secret] = at.secret
    session[:realm_id] = params['realmId']

    redirect_to root_url, notice: "Your Quickbooks account has been successfully linked."
  end
end
