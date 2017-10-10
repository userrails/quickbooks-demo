class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :token

  rescue_from QboApi::BadRequest, with: :qbo_bad_request
  rescue_from QboApi::NotImplementedError, with: :qbo_not_implemented_error
  rescue_from QboApi::Unauthorized, with: :qbo_unauthorized
  rescue_from QboApi::Forbidden, with: :qbo_forbidden
  rescue_from QboApi::NotFound, with: :qbo_not_found
  rescue_from QboApi::TooManyRequests, with: :qbo_too_many_requests
  rescue_from QboApi::InternalServerError, with: :qbo_internal_server_error
  rescue_from QboApi::ServiceUnavailable, with: :qbo_service_unavailable

  def token
    Token.find_by(realm_id: session[:realmID]) || Token.first
  end

  def qbo_bad_request(error)
    redirect_to root_path, alert: "Quickbooks Bad Request: #{error}"
  end

  def qbo_not_implemented_error(error)
    redirect_to root_path, alert: "Quickbooks Method Not implemented: #{error}"
  end

  def qbo_unauthorized(error)
    redirect_to root_path, alert: "Quickbooks Unauthorized: #{error}"
  end

  def qbo_forbidden(error)
    redirect_to root_path, alert: "Quickbooks Forbidden: #{error}"
  end

  def qbo_not_found(error)
    redirect_to root_path, alert: "Quickbooks Not Found: #{error}"
  end

  def qbo_too_many_requests(error)
    redirect_to root_path, alert: "Quickbooks Too many requests: #{error}"
  end

  def qbo_internal_server_error(error)
    redirect_to root_path, alert: "Quickbooks Internal Server error: #{error}"
  end

  def qbo_service_unavailable(error)
    redirect_to root_path, alert: "Quickbooks Service Unavailable: #{error}"
  end
end
