require "rails_helper"

RSpec.describe "Create new trip pipeline" do
  it "has working form" do
    visit "/login?user_id=1"
    visit "/areas/2107/trips/new"

    expect(page).to have_content("Create Trip to Little Yosemite Valley, California")
    fill_in "name", with: "Super Fun Trip"
    fill_in "Start date", with: "2023-06-07"
    fill_in "End date", with: "2023-06-09"
    fill_in "Description", with: "A fun thing at a fun place"
    expect(page).to have_button("Add friends")
    # expect(current_path).to eq("/areas/2107/trips/#{Trip.last.id}/users/new")
    # test that the trip actually got created with correct host id
  end

  it "can add users to trip" do
    visit "/login?user_id=1"
    visit "/areas/2107/trips/new"

    fill_in "name", with: "Super Fun Trip"
    fill_in "Start date", with: "2023-06-07"
    fill_in "End date", with: "2023-06-09"
    fill_in "Description", with: "A fun thing at a fun place"
    click_button "Add friends"

    expect(page).to have_content("Add Friends to Super Fun Trip")
  end
end
