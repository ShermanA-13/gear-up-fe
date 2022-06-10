require "rails_helper"

describe "Trips Index page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
  end
  describe "When logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)

      visit root_path
      find('#login').click
      visit "users/1/trips/"
    end

    it "displays trip attributes" do
      within "#trip-1" do
        expect(page).to have_content("boo boo trip")
        expect(page).to have_content("2022-06-07 to 2022-06-08")
      end
      within "#trip-2" do
        expect(page).to have_content("first trip")
        expect(page).to have_content("2022-06-06 to 2022-06-07")
      end
    end
  end
end
