module AuthenticatedTestHelper
  # Sets the current citizen in the session from the citizen fixtures.
  def login_as(citizen)
    @request.session[:citizen_id] = citizen ? (citizen.is_a?(Citizen) ? citizen.id : citizens(citizen).id) : nil
  end

  def authorize_as(citizen)
    @request.env["HTTP_AUTHORIZATION"] = citizen ? ActionController::HttpAuthentication::Basic.encode_credentials(citizens(citizen).login, 'monkey') : nil
  end
  
end
