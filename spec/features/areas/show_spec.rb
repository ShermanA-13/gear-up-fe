require "rails_helper"

describe "Area show page" do
  before do
    visit "/areas/2107"
  end

  it "shows specified area information", :vcr do
    expect(page).to have_content("Little Yosemite Valley")
    expect(page).to have_content("State: California")
    expect(page).to have_content("Learn more about this route via The Mountain Project")
    expect(page).to have_link("The Mountain Project")
    within("#lat_long_data") do
      expect(page).to have_content("Latitude: 37.73648")
      expect(page).to have_content("Longitude: -119.47885")
    end

    expect(page).not_to have_content("Yosemite Point")
    expect(page).not_to have_content("Yosemite Falls Wall")
    expect(page).not_to have_content("Yosemite Crack Zone (Left)")
  end
end
