require "rails_helper"

RSpec.describe "User show page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    # @users = JSON.parse(File.read('spec/fixtures/users.json'), symbolize_names: true)
    # @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
  end

  describe "when logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      # allow(UserService).to receive(:users).and_return(@users)
      allow(ItemService).to receive(:items).and_return(@items)
      # allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit root_path
      click_link 'Login'
    end

    it "shows user data" do
      expect(page).to have_content("Bonny Jowman's Page")
      expect(page).to have_content("Email: ivebeentrapped@inthecomputer.org")

      expect(page).not_to have_content("monkey face's Page")
      expect(page).not_to have_content("Email: foo@email.com")
    end
  end
end
