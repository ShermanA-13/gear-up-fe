require "rails_helper"

RSpec.describe "Create new trip pipeline" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @users = JSON.parse(File.read('spec/fixtures/users.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
    @create_a_trip = JSON.parse(File.read('spec/fixtures/create_a_trip.json'), symbolize_names: true)
    @trip_by_trip_id = JSON.parse(File.read('spec/fixtures/trip_by_trip_id.json'), symbolize_names: true)
    @create_trip_users = JSON.parse(File.read('spec/fixtures/create_trip_users.json'), symbolize_names: true)
    @trip_info = JSON.parse(File.read('spec/fixtures/trip_info.json'), symbolize_names: true)

    @area_by_id = JSON.parse(File.read('spec/fixtures/area_by_id.json'), symbolize_names: true)
  end

  describe "when user is logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(UserService).to receive(:users).and_return(@users)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      allow(TripService).to receive(:create).and_return(@create_a_trip)
      allow(TripService).to receive(:get_trip_by_id).and_return(@trip_by_trip_id)
      allow(TripService).to receive(:get_all_trip_info).and_return(@trip_info)
      allow(TripUsersService).to receive(:create_trip_users).and_return(@create_trip_users)

      allow(AreaService).to receive(:area_by_id).and_return(@area_by_id)


      visit root_path
      find('#login').click
      visit "/areas/2107/trips/new"
    end

    it "has working form" do


      expect(page).to have_content("Create Trip to Little Yosemite Valley, California")
      fill_in "name", with: "another first trip"
      fill_in "Start date", with: "2023-06-08"
      fill_in "End date", with: "2023-06-09"
      fill_in "Description", with: "baby's first trip"
      expect(page).to have_button("Add friends")
    end

    it "can add users to trip" do
      fill_in "name", with: "another first trip"
      fill_in "Start date", with: "2023-06-08"
      fill_in "End date", with: "2023-06-09"
      fill_in "Description", with: "baby's first trip"
      click_button "Add friends"

      expect(page).to have_content("Add Friends to another first trip")
      expect(page).to have_content("Bonny jowman")
      check("user_ids_1")
      click_button "Create Trip"
      expect(page).to have_content("another first trip")
    end
  end

end
