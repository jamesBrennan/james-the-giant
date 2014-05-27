OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.test? or Rails.env.development?
  provider :google_oauth2, ENV['JTG_GOOGLE_CLIENT_ID'], ENV['JTG_GOOGLE_SECRET'], {:prompt => "select_account"}
end

# https://github.com/intridea/omniauth/wiki/FAQ#omniauthfailureendpoint-does-not-redirect-in-development-mode
OmniAuth.config.on_failure = Proc.new do |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end
