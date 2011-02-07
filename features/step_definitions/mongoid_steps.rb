Given /^an? (.+) exists with an? (.+) of "([^"]*)"$/ do |model, field, value|
  factory_name = model.gsub(' ', '_')
  Factory factory_name, field => value
end

Then /^an? (.+) should exist with an? (.+) of "([^"]*)"$/ do |model, field, value|
  clazz = eval model.titlecase.gsub(' ', '')
  @instance = clazz.first :conditions => { field => value }
  @instance.should_not be_nil
end
