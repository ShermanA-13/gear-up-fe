require "rails_helper"

describe "Trip show page" do
  before do
    visit "/trips/1"
    save_and_open_page
  end

  it "displays the Trips's attributes (name, start_date, end_date)", :vcr do
    expect(page).to have_content("Name: Adventure Time ")
    expect(page).to have_content("Description: It's gonna be a wild one")
    expect(page).to have_content("Start Date: 2022-08-14")
    expect(page).to have_content("End Date: 2022-08-29")

    expect(page).not_to have_content("Name: Big Bummer")
    expect(page).not_to have_content("Description: zero fun to be had")
  end
end
