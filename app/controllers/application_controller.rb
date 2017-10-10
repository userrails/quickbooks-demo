class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :token

  def token
    Token.find_by(realm_id: session[:realmID]) || Token.first
  end
end
