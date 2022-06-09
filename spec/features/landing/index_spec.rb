require 'rails_helper'

RSpec.describe 'Landing index page' do
  before do
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
    allow(UserService).to receive(:create_user).and_return(@user)
    allow(UserService).to receive(:user).and_return(@user)
    allow(ItemService).to receive(:items).and_return(@items)
    allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
    visit root_path
  end

  it 'has button to login via Google' do
    click_link 'Login'
    expect(current_path).to eq('/dashboard')
  end
end
