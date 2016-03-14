require 'watir-webdriver'
require 'cucumber'

Given(/^a user goes to Amazon$/) do
  @browser = Watir::Browser.new :ff
  @browser.goto "http://www.amazon.com/"
end

When(/^they search for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "twotabsearchtextbox").set "#{arg}"
  @browser.send_keys :return
end

Then(/^amazon should return results for "([^"]*)"$/) do |arg|
  @browser.div(:id => "result 2").wait_until_present
  page_output = @browser.div(:id => "resultsCol").text.inclue? "#{arg}"
  assert (page_output == true)
  @browser.close
end

When(/^they search for (.*)$/) do |query|
  @browser.text_field(:id => "twotabsearchtextbox").set "#{query}"
  @browser.send_keys :return
end

Then(/^amazon should return results for (.*)$/) do |query|
  @browser.div(:id => "result 2").wait_until_present
  page_output = @browser.div(:id => "resultsCol").text.inclue? "#{query}"
  assert (page_output == true)
  @browser.close
end