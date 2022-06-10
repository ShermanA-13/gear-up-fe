require "rails_helper"

describe "Area show page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
    @user_not_found = JSON.parse(File.read('spec/fixtures/user_not_found.json'), symbolize_names: true)
    @item_not_found = JSON.parse(File.read('spec/fixtures/item_not_found.json'), symbolize_names: true)

    @area_search = JSON.parse(File.read('spec/fixtures/area_search.json'), symbolize_names: true)
    @area_by_id = JSON.parse(File.read('spec/fixtures/area_by_id.json'), symbolize_names: true)
    @weather_by_area = JSON.parse(File.read('spec/fixtures/weather_by_area.json'), symbolize_names: true)
  end
  describe "when logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)

      allow(AreaService).to receive(:search).and_return(@area_search)
      allow(AreaService).to receive(:area_by_id).and_return(@area_by_id)
      allow(WeatherService).to receive(:get_weather_by_area).and_return(@weather_by_area)
      visit root_path
      find('#login').click

      visit "/areas/2107"
    end

    it "shows specified area information" do
      expect(page).to have_content("Little Yosemite Valley")
      expect(page).to have_content("California")
      expect(page).to have_content("Learn more about this area on Mountain Project")
      expect(page).to have_link("Mountain Project")

      expect(page).not_to have_content("Yosemite Point")
      expect(page).not_to have_content("Yosemite Falls Wall")
      expect(page).not_to have_content("Yosemite Crack Zone (Left)")
    end


    it "does show the new trip button if user is logged in" do
      visit "/areas/2107"
      expect(page).to have_button("Create a Trip for this Area")

      click_on "Create a Trip for this Area"
      expect(current_path).to eq("/areas/2107/trips/new")
    end

  end

  it "does not show the new trip button if user is not logged in" do
    expect(page).not_to have_button("Create a Trip for this Area")
  end

end
