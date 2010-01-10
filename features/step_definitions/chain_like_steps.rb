Given /^I have liked #{capture_model}$/ do |model_name|
  Factory(:like, :user_id => @user.id, :chain_id => model(model_name).id)
  @user.likes.size.should == 1
  model(model_name).likes.size.should == 1
end

Given /^#{capture_model} has liked #{capture_model}$/ do |user_name, chain_name|
  Factory(:like, :user_id => model(user_name).id, :chain_id => model(chain_name).id)
end

Then /^I should have liked #{capture_model}$/ do |model_name|
  @user.likes.size.should == 1
  model(model_name).likes.size.should == 1
end

Then /^I should have unliked #{capture_model}$/ do |model_name|
  @user.likes.size.should == 0
  model(model_name).likes.size.should == 0
end