When(/^I specify a valid twitter handle$/) do
  visit '/'
  fill_in 'handle', with: 'limeblast'
  click_button 'go go go!!!!'
end

Then(/^I will see the correct value$/) do
  pending # express the regexp above with the code you wish you had
end
