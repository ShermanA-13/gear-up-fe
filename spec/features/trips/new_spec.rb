require "rails_helper"

RSpec.describe "Create new trip pipeline" do
  it "has working form" do
    visit "/login?user_id=1"
    visit "/areas/2108/trips/new"

    expect(page).to have_content("Create Trip to Liberty Cap, California")
    fill_in "name", with: "Super Fun Trip"
    fill_in "Start date", with: "2023-06-07"
    fill_in "End date", with: "2023-06-09"
    fill_in "Description", with: "A fun thing at a fun place"
    expect(page).to have_button("Add friends")
  end

  it "can add users to trip" do
    visit "/login?user_id=1"
    visit "/areas/2108/trips/new"

    fill_in "name", with: "Super Fun Trip"
    fill_in "Start date", with: "2023-06-07"
    fill_in "End date", with: "2023-06-09"
    fill_in "Description", with: "A fun thing at a fun place"
    click_button "Add friends"

    expect(page).to have_content("Add Friends to Super Fun Trip")
    expect(page).to have_content("Something this")
    check("user_ids_1")
    click_button "Create Trip"
    expect(page).to have_content("Super Fun Trip")
  end
end
