require "rails_helper"

RSpec.describe "User show page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/user_item_show.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
  end

  describe "when logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit root_path
      find('#login').click
      visit '/users/2'
    end

    it "shows user data" do
      expect(page).to have_content("Bonny Jowman")
      expect(page).to have_content("ivebeentrapped@inthecomputer.org")

      expect(page).not_to have_content("monkey face")
      expect(page).not_to have_content("foo@email.com")
    end

    it "shows a user's top 3 items" do
      within "#items" do
        expect(page).to have_content("Bonny's Shed")

        expect(page).to have_content("Tent 1")
        expect(page).to have_content("Count: 1")
        expect(page).to have_content("Item ID: 1")

        expect(page).to have_content("Organic Crash Pad")
        expect(page).to have_content("Count: 5")
        expect(page).to have_content("Item ID: 2")
      end
    end

    it "has links to item show pages" do
      within "#items" do
        click_link "Tent 1"
      end

      expect(current_path).to eq("/users/1/items/1")
      expect(page).to have_content("Tent 1")
      expect(page).to_not have_content("Organic Crash Pad")
    end

    it "has a link to the user shed" do
      within "#items" do
        click_link "Bonny's Shed"
      end

      expect(current_path).to eq("/users/1/items")
      expect(page).to have_content("Tent 1")
      expect(page).to have_content("Organic Crash Pad")
    end

    it "shows next 2 upcoming trips the user is a part of" do
      expect(page).to have_content("Upcoming Trips")

      within "#trip-1" do
        expect(page).to have_content("boo boo trip")
        expect(page).to have_content("Description: trip I guess")
        expect(page).to have_content("Start date: 2022-06-07")
        expect(page).to have_content("End date: 2022-06-08")
      end

      within "#trip-2" do
        expect(page).to have_content("first trip")
        expect(page).to have_content("Description: baby's first trip")
        expect(page).to have_content("Start date: 2022-06-06")
        expect(page).to have_content("End date: 2022-06-07")
      end
    end
  end

  describe "error handling" do
    before do
      visit "users/0"
    end

    it "fails gracefully" do
      expect(page).to have_content("No user with id 0")
      expect(page).to have_content("Code: 404")
    end
  end
end
