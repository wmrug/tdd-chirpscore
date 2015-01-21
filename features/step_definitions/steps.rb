When(/^I specify a valid twitter handle$/) do
  visit '/'
  fill_in 'handle', with: 'limeblast'
  click_button 'go go go!!!!'
end

Then(/^I will see the correct value$/) do
  expect(page).to have_content('2.27')
end
