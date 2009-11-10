Given /^I have started a chain named "([^\"]*)"$/ do |name|
  Factory(:chain, :name => name, :user => @user)
end

Given /^I have not added an input source to "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  chain.gear.select {|g| g.input_source?}.each {|g| g.destroy}
end

Given /^I have not added an audio file to "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  chain.audio = nil
  chain.save
end

Given /^I have not added a preamp to "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  chain.gear.select {|g| g.preamp?}.each {|g| g.destroy}
end

Given /^I have added an input source to "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  mic = Factory(:mic)
  Factory(:chain_gear, :gear => mic, :chain => chain)
end

Given /^I have added a preamp to "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  preamp = Factory(:preamp)
  Factory(:chain_gear, :gear => preamp, :chain => chain)
end

Given /^I have added an audio file to "([^\"]*)"$/ do |name|
   When %{I view the chain named "#{name}"}
   When %{I attach the file at "test/audio_files/guitar.aif" to "chain_audio"}
   When %{I press "Submit"}
end

Given /^I have added a dynamics processor to "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  dynamics_processor = Factory(:dynamics_processor)
  Factory(:chain_gear, :gear => dynamics_processor, :chain => chain)
end

When /^I add an input source to "([^\"]*)"$/ do |name|
  Given %{I have added an input source to "#{name}"}
end

When /^I view the chain named "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  visit chain_path(chain)
end

Then /^I should be viewing the chain "([^\"]*)"$/ do |name|
  chain = Chain.find(:first, :conditions => {:name => name})
  assert_equal chain_path(chain), URI.parse(current_url).path
end

Then /^I should see the input source first$/ do
  doc = Nokogiri::HTML(@response.body)
  assert_match(/mic/, doc.css('.gear')[0]['class'])
end

Then /^I should see the "([^\"]*)" second$/ do |type|
  doc = Nokogiri::HTML(@response.body)
  assert_match(/#{type.downcase.gsub(' ', '')}/, doc.css('.gear')[1]['class'])
end

Then /^I should see the "([^\"]*)" third$/ do |type|
  doc = Nokogiri::HTML(@response.body)
  assert_match(/#{type.downcase.gsub(' ', '')}/, doc.css('.gear')[2]['class'])
end