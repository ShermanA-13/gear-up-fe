require 'rails_helper'

RSpec.describe 'navbar' do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    # @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
  end

  describe 'when logged in' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit root_path
      click_link 'Login'
    end

    it 'logo links to user dashboard' do
      visit "/users/1/items"

      find('#logo').click
      expect(current_path).to eq('/dashboard')
    end

    it 'links to user shed' do
      within('.navbar-nav') do
        click_on 'MyShed'
      end
      expect(current_path).to eq("/users/1/items")
    end

    it 'links to user trips page' do
      within('.navbar-nav') do
        click_on 'MyTrips'
      end
      expect(current_path).to eq("/users/1/trips")
    end
  end

  describe 'when not logged in' do
    before do
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit "/users/1"
    end

    it 'logo links to rooth path when user is not logged in' do
      find('.navbar-brand').click
      expect(current_path).to eq(root_path)
    end

    it 'displays only logo and Login links when user is not logged in' do
      expect(page).not_to have_content('Logout')
      expect(page).not_to have_content('MyShed')
      expect(page).not_to have_content('MyTrips')

      expect(page).to have_content('Login')
    end
  end
end
