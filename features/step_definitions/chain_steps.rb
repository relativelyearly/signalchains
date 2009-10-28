Given /^I have started a chain named "([^\"]*)"$/ do |name|
  Factory(:chain, :name => name)
end

When /^I view the chain named "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  visit chain_path(chain)
end

Then /^I should be viewing the chain "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  assert_equal chain_path(chain), URI.parse(current_url).path
end