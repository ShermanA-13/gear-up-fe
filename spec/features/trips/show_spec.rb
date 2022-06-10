require "rails_helper"

describe "Trip show page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
    @trip_info = JSON.parse(File.read('spec/fixtures/trip_info.json'), symbolize_names: true)
  end

  describe "when logged in" do

    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(TripService).to receive(:get_all_trip_info).and_return(@trip_info)

      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)

      visit root_path
      find('#login').click
      visit "/trips/1"
    end

    it "displays the Trips attributes (name, start_date, end_date)" do
      expect(page).to have_content("another first trip")
      expect(page).to have_content("2022-06-08 - 2022-06-09")
      expect(page).to have_content("baby's first trip")
    end

    it "displays invited users" do

      within "#users" do
        expect(page).to have_content("Bonny Jowman")
        expect(page).to have_content("ivebeentrapped@inthecomputer.org")
        expect(page).to have_content("asda this")
        expect(page).to have_content("cheese@email.com")
      end

    end

    it "displays a map" do

      within "#google_map" do
        expect(page).to have_css("iframe")
      end

    end

    it "has a button to delete the trip" do
      within "#buttons" do
        expect(page).to have_button("Delete another first trip")
      end

    end
  end

end
