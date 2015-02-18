require 'spec_helper'
require_relative '../app/app'  # <-- your sinatra app

RSpec.describe 'The Chirpscore App' do
  def app
    Chirpscore
  end

  let(:dummy_timeline) { double("dummy_timeline") }

  it "renders the homepage" do
    get '/'
    expect(last_response).to be_ok
  end

  it "renders the chirpscore" do
    allow_any_instance_of(Twitter::REST::Client).to receive(:user_timeline).with("faketwitteruser") { dummy_timeline }
    allow_any_instance_of(ChirpscoreCalculator).to receive(:calculate).with(dummy_timeline)
    post '/result', handle: "faketwitteruser"
    expect(last_response.body).to have_text "123456789"
  end
end
