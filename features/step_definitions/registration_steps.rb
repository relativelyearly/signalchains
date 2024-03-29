Given /^I am not logged in$/ do
end

Given /^I am registered with "(.*)\/(.*)"$/ do |login, password|
  if login =~ /@/
    user = Factory(:user, :email => login, :password => password,
                 :password_confirmation => password)
  else
    user = Factory(:user, :login => login, :password => password,
           :password_confirmation => password)
  end
end

Given /^I am logged in as "(.*)\/(.*)"$/ do |login, password|
  if login =~ /@/
    @user = Factory(:user, :email => login, :password => password,
                 :password_confirmation => password)
    find_model('user', "email: \"#{login}\"")
  else
    @user = Factory(:user, :login => login, :password => password,
           :password_confirmation => password)
    find_model('user', "login: \"#{login}\"")
  end

  When %{I go to the login page}
  And %{I fill in "user_session_login" with "#{login}"}
  And %{I fill in "password" with "#{password}"}
  And %{I press "Login"}

end

Given /^no user exists with an email of "([^\"]*)"$/ do |email|
  if User.find_by_email(email)
    User.find_by_email(email).destroy
  end
end

Given /^no user exists with the login "([^\"]*)"$/ do |login|
  if User.find_by_login(login)
    User.find_by_login(login).destroy
  end
end

Then /^a password reset message should be sent to "(.*)"$/ do |email|
  user = User.find_by_email(email)
  sent = ActionMailer::Base.deliveries.first
  assert_equal [user.email], sent.to
  assert_match /Password Reset Instructions/i, sent.subject
  assert !user.perishable_token.blank?
  assert_match /#{user.perishable_token}/, sent.body
end

When /^I request a password reset for "([^\"]*)"$/ do |email|
  When %{I go to the password reset page}
  And %{I fill in "Email" with "#{email}"}
  And %{I press "Reset my password"}
end

When /^I follow the password reset link sent to "([^\"]*)"$/ do |email|
  user = User.find_by_email(email)
  visit "/password_resets/#{user.perishable_token}/edit"
end

Then /^I should be logged in$/ do
  assert controller.logged_in?
end

Then /^I should not be logged in$/ do
  assert !controller.logged_in?
end