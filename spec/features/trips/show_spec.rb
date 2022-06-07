require "rails_helper"

describe "Trip show page" do
  before do
    visit "/trips/1"
  end

  it "displays the Trips attributes (name, start_date, end_date)", :vcr do
    expect(page).to have_content("Name: first trip")
    expect(page).to have_content("Start Date: 2022-06-05")
    expect(page).to have_content("End Date: 2022-06-06")
    expect(page).to have_content("Description: baby's first trip")

    expect(page).not_to have_content("Name: Big Bummer")
    expect(page).not_to have_content("Description: zero fun to be had")
  end
end
