When(/^I specify "(.*?)"$/) do |handle|  
  visit '/'
  fill_in 'handle', with: handle
  click_button 'go go go!!!!'
end

Then(/^I will see (\d+\.\d+)$/) do |expected_chirpscore|
  expect(page).to have_content(expected_chirpscore)
end

Then(/^I will see the error message "(.*?)"$/) do |expected_error|
  expect(page).to have_content(expected_error)
end