require "rails_helper"

RSpec.describe "Trip edit page" do
  before do
    visit "/login?user_id=1"
    visit "/trips/1/edit"
  end

  it "updates trip record" do
    fill_in "name", with: "another first trip"
    click_button "Update Trip"
    expect(current_path).to eq("/trips/1")
  end
end
