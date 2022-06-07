require "rails_helper"

RSpec.describe "Create new trip page" do
  it "has working form", :vcr do
    visit "/areas/2107/trips/new"

    expect(page).to have_content("Create Trip to Little Yosemite Valley, California")
    fill_in "Trip name", with: "Super Fun Trip"
    fill_in "Start date", with: "2023-06-07"
    fill_in "End date", with: "2023-06-09"
    fill_in "Description", with: "A fun thing at a fun place"
    click_button "Add friends"
    # expect(current_path).to eq("/")
  end
end
