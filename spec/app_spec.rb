require 'spec_helper'
require_relative '../app/app'  # <-- your sinatra app

RSpec.describe 'The Chirpscore App' do
  def app
    Chirpscore
  end

  it "renders the homepage" do
    get '/'
    expect(last_response).to be_ok
  end
end
