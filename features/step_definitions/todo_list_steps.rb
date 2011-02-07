Given /^the following todo lists exist$/ do |table|
  table.hashes.each do |hash|
    @user = User.first :conditions => {:email => hash["User"]}
    @user = Factory.create :user, :email => hash["User"] if @user.nil?
    Factory.create :todo_list, :name => hash["Name"], :user => @user
  end
end

Then /^"([^"]*)" should have a todo list named "([^"]*)"$/ do |email, name|
  @user = User.where(:email => email).first
  @todo_list = @user.todo_lists.where(:name => name).first
  @todo_list.should_not be_nil
end
