require "rails_helper"

RSpec.describe "add trip users page" do
  before do
    visit "/login?user_id=1"
  end
  it "allows you to add users to a trip" do
    visit "/trips/1/users"
  end
end
