Given /^I have recommended #{capture_model}$/ do |model_name|
  Factory(:recommendation, :user_id => @user.id, :recommendable => model(model_name))
  @user.recommendations.size.should == 1
  model(model_name).recommendations.size.should == 1
end

Given /^#{capture_model} has recommended #{capture_model}$/ do |user_name, chain_name|
  Factory(:recommendation, :user_id => model(user_name).id, :recommendable => model(chain_name))
end

Then /^I should have recommended #{capture_model}$/ do |model_name|
  @user.recommendations.size.should == 1
  model(model_name).recommendations.size.should == 1
end

Then /^I should have unrecommended #{capture_model}$/ do |model_name|
  @user.recommendations.size.should == 0
  model(model_name).recommendations.size.should == 0
end