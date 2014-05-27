Given /^a logged\-in user$/ do
  step 'I view the sign in page'
  step 'I sign in with Google'
end

When /I sign in with Google/ do
  click_link "Sign in with Google"
end

When /^I view the sign in page$/ do
  visit '/admin/sign_in'
end

Then /^I should be on the page "(.*?)"$/ do |path|
  uri = URI.parse(current_url)
  expect(uri.path).to eql(path)
end

Then /^I should see the sign in page$/ do
  step %{I should be on the page "/admin/sign_in"}
end

Then /^I should see the admin page$/ do
  step %{I should be on the page "/admin"}
end

Then /^I should see a message "(.*?)"$/ do |message|
  expect(page).to have_content(message)
end
