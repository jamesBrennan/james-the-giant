class Authenticator
  WHITELISTED_DOMAINS = %w(james-the-giant.com)

  def initialize(session)
    @session = session
  end

  def load_user
    @session[:user_data]
  end

  def clear_user
    @session[:user_id] = @session[:user_data] = nil
  end

  def authenticate(auth)
    if valid_domain?(auth)
      @session[:user_id] = auth['uid']
      @session[:user_data] = auth['info'].to_hash
    else
      clear_user
    end
  end

  def valid_domain?(auth)
    domain = auth['info']['email'][/^.*@(.*)/, 1]
    WHITELISTED_DOMAINS.include?(domain)
  end
end
