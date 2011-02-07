Given /^I am logged in as "([^"]*)"$/ do |email|
  hash = {:email => email}
  @user = User.first(:conditions => hash) 
  @user = Factory.create(:user, hash) if @user.nil?
  visit new_user_session_path
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @user.password
  click_button "Sign in"
end
