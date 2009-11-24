Given /^I have followed #{capture_model}$/ do |model_name|
  Factory(:follow, :user_id => @user.id, :followed_id => model(model_name).id)
  @user.follows.size.should == 1
end