RSpec.feature "Hello World" do
  scenario "Show me the money!" do
    visit "/hello"
    expect(page).to have_text("Hello Chirpscore!")
  end
end
