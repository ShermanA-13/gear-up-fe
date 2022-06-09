require "rails_helper"

RSpec.describe "Trip edit page" do
  before do
    visit "/login?user_id=1"
    visit "/trips/1/edit"
  end

  it "updates trip record" do
    expect(page).to have_content("Edit first trip")
  end
end
