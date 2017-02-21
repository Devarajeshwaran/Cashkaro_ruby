Given(/^I am on Cashkaro Login Page$/) do
  visit_page
end

When(/^I click on Join Free button$/) do
  click_join_free_button
end

And(/^I click on join with facebook button$/) do
  click_join_with_facebook_button
end

And(/^I fill up (.*) in full name field$/) do |name|
  fill_username(name)
end

And(/^I fill up (.*) in email address and confirm email address fields$/) do |emailid|
  fill_emailid(emailid)
end

And(/^I fill up (.*) in password field$/) do |password|
  fill_password(password)
end

Then(/^I click on Join free now button$/) do
  click_join_free_now_button
end

And(/^I tick the terms and conditions checkbox$/) do
  tick_terms_and_conditions
end

And(/^I logout of Cashkaro$/) do
  logout_cashkaro
end

Then(/^I click on Sign in button$/) do
  click_sign_in
end

Then(/^I click on submit request button$/) do
  click_submit_request_button
end

Then(/^I click on Forgot password link and I fill up (.*) in email address field$/) do |emailid|
  click_forgot_password(emailid)
end

Then(/^I verify if the password has been sent$/) do
  verify_password_sent
end

Then(/^I enter user details$/) do
  enter_user_details
end

Then(/^I enter user details with (.*) as email address and (.*) as password$/) do |emailid, password|
  enter_user_details(emailid, password)
end

Then(/^I click on Sign in button in pop up window$/) do
  click_sign_in_pop_up_window
  verify_my_account_button
end

And(/^I enter the facebook user details with (.*) as username and (.*) as password$/) do |emailid, password|
  log_into_facebook(emailid, password)
  facebook_log_in
end