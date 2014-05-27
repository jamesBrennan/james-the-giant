@omniauth
Feature: Authentication
  As a manager
  I only want to allow James the Giant employees to access admin
  So that I can be sure that our information is secure

  Scenario: Redirect an unauthenticated user
    When I visit the admin page
    Then I should see the sign in page

  @omniauth_success
  Scenario: Successful login
    When I view the sign in page
    And I sign in with Google
    Then I should see the admin page

  @omniauth_bad_domain
  Scenario: Attempting to login with a non james-the-giant email address
    When I view the sign in page
    And I sign in with Google
    And I should see a message "Your domain may not be allowed access"
