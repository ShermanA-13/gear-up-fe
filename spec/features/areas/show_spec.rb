require "rails_helper"

describe "Area show page" do
  before do
    visit "/areas/2107"
  end

  it "shows specified area information", :vcr do
    expect(page).to have_content("Little Yosemite Valley")
    expect(page).to have_content("State: California")
    expect(page).to have_content("Learn more about this route via Mountain Project")
    expect(page).to have_link("Mountain Project")
    within("#lat_long_data") do
      expect(page).to have_content("Latitude: 37.73648")
      expect(page).to have_content("Longitude: -119.47885")
    end

    expect(page).not_to have_content("Yosemite Point")
    expect(page).not_to have_content("Yosemite Falls Wall")
    expect(page).not_to have_content("Yosemite Crack Zone (Left)")
  end

  it "does not show the new trip button if user is not logged in", :vcr do
    expect(page).not_to have_button("Create a Trip for this Area")
  end

  it "does show the new trip button if user is logged in", :vcr do
    visit "/login?user_id=1"
    visit "/areas/2107"
    expect(page).to have_button("Create a Trip for this Area")

    click_on "Create a Trip for this Area"
    expect(current_path).to eq("/areas/2107/trips/new")
  end
end
