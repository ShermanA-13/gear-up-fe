require "rails_helper"

describe "Area search (index) page" do
  before do
    visit "/areas"
  end

  it "has a search bar", :vcr do
    expect(find('form')).to have_content('Search')
  end

  describe "search functionality" do

    before do
      fill_in "Search", with: "yosemite"
      click_on "Search"
    end

    it "searches and returns some areas", :vcr do
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

    it "has a link to the new trip page", :vcr do
      within("#area_0") do
        click_on "Create a Trip for this Area"

        expect(current_path).to eq("/areas/2107/trips/new")
      end
    end
  end
end
