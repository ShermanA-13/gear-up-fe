require "rails_helper"

describe "Area search (index) page" do
  before do
    visit "/areas/search"
  end

  it "has a search bar" do
    expect(find('form')).to have_content('Search')
  end

  it "searches and returns some areas" do
    fill_in "Search", with: "yosemite"
    click_on "Search"

    within("#area_1") do
      expect(page).to have_content("Little Yosemite Valley")
      expect(page).to have_content("California")
    end
    within("#area_2") do
      expect(page).to have_content("Yosemite Point")
      expect(page).to have_content("California")
    end
    within("#area_3") do
      expect(page).to have_content("Yosemite Falls Wall")
      expect(page).to have_content("California")
    end
  end
end
