require "rails_helper"

describe "Trip show page" do
  before do
    visit "/trips/1"
  end

  it "displays the Trips attributes (name, start_date, end_date)", :vcr do
    expect(page).to have_content("Name: first trip")
    expect(page).to have_content("Start Date: 2022-06-08")
    expect(page).to have_content("End Date: 2022-06-09")
    expect(page).to have_content("Description: baby's first trip")

    expect(page).not_to have_content("Name: Big Bummer")
    expect(page).not_to have_content("Description: zero fun to be had")
  end

  it "displays invited users", :vcr do
    within "#users" do
      expect(page).to have_content("something this")
      expect(page).to have_content("email@email.com")
      expect(page).to have_content("asda this")
      expect(page).to have_content("cheese@email.com")
    end
  end

  it "displays weather error", :vcr do
    within "#weather" do
      expect(page).to have_content("Weather is currently Unavailable")
    end
  end

  it "displays a map", :vcr do
    within "#google_map" do
      expect(page).to have_css("iframe")
    end
  end
end
