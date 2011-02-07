require 'spec_helper'

describe TodoList do
  describe "preventing duplicate lists" do
    before :each do
      @user = Factory.create :user
      @todo_list = Factory.create :todo_list, :user => @user, :name => "todo"
    end

    it "should prevent a list from being created if one with the same name exists" do
      @todo_list2 = Factory.build :todo_list, :user => @user, :name => "todo"
      @todo_list2.save.should be_false
    end

    it "should only enforce name uniqueness for a particular user" do
      @user2 = Factory.create :user
      @todo_list2 = Factory.build :todo_list, :user => @user2, :name => "todo"
      @todo_list2.save.should be_true
    end
  end
end
