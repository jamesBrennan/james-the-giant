Before('@omniauth') do
  OmniAuth.config.test_mode = true

end

After('@omniauth') do
  OmniAuth.config.test_mode = false
end

Before('@omniauth_success') do
  OmniAuth.config.mock_auth[:google_oauth2] =
      OmniAuth::AuthHash.new({:provider => 'google_oauth2',
                              :uid => '123545',
                              :info => {
                                  :name => 'Test User',
                                  :first_name => 'Test',
                                  :last_name => 'User',
                                  :email => 'test_user@james-the-giant.com'
                              }
                             })
end

Before('@omniauth_bad_domain') do
  OmniAuth.config.mock_auth[:google_oauth2] =
      OmniAuth::AuthHash.new({:provider => 'google_oauth2',
                              :uid => '123545',
                              :info => {
                                  :name => 'John Public',
                                  :first_name => 'John',
                                  :last_name => 'Public',
                                  :email => 'john_public@example.com'
                              }
                             })
end

Before('@omniauth_failure') do
  OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
end

