require 'rails_helper'

RSpec.describe 'Landing index page' do
  before do
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    visit root_path
  end

  it 'has button to login via Google', :vcr do
    click_link 'Login With Google'
    save_and_open_page
    # expect(current_path).to eq('/dashboard')
  end
end
