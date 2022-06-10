require "rails_helper"

RSpec.describe "Trip edit page" do
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
    @update_trip = JSON.parse(File.read('spec/fixtures/update_trip.json'), symbolize_names: true)

    @area_by_id = JSON.parse(File.read('spec/fixtures/area_by_id.json'), symbolize_names: true)
  end

  describe "When logged in" do
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
      allow(TripService).to receive(:update_trip).and_return(@update_trip)
      allow(TripUsersService).to receive(:create_trip_users).and_return(@create_trip_users)

      allow(AreaService).to receive(:area_by_id).and_return(@area_by_id)


      visit root_path
      find('#login').click
      visit "/trips/1/edit"
    end

    it "updates trip record" do
      fill_in "name", with: "another first trip"
      click_button "Update Trip"
      expect(current_path).to eq("/trips/1")
    end
  end
end
