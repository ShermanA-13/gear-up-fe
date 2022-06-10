require "rails_helper"

describe "Area search (index) page" do
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
      visit "/areas"
    end

    it "has a search bar" do
      expect(find('form')).to have_content('Search')
    end

    describe "search functionality" do

      before do
        fill_in "Search", with: "yosemite"
        click_on "Search"
      end

      it "searches and returns some areas" do

        within("#area_0") do
          expect(page).to have_content("Little Yosemite Valley")
          expect(page).to have_content("California")
        end

        within("#area_1") do
          expect(page).to have_content("Yosemite Point")
          expect(page).to have_content("California")
        end

        within("#area_2") do
          expect(page).to have_content("Yosemite Falls Wall")
          expect(page).to have_content("California")
        end

      end

      it "has a link to the new trip page" do
        within("#area_0") do
          click_on "Create a Trip"

          expect(current_path).to eq("/areas/2107/trips/new")
        end

      end

      it "has links to area show pages" do

        within("#area_0") do
          click_on "Little Yosemite Valley"

          expect(current_path).to eq("/areas/2107")
        end

      end

    end

  end

end
