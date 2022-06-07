require "rails_helper"

describe "Trips Index page" do
  before do
    visit "users/1/trips/"
  end
  it "displays trip attributes", :vcr do
    within "#trip-1" do
      expect(page).to have_content("Name: first trip")
      expect(page).to have_content("Start Date: 2022-06-05")
      expect(page).to have_content("End Date: 2022-06-06")
      expect(page).to have_content("Description: baby's first trip")
    end
    within "#trip-2" do
      expect(page).to have_content("Name: boo boo trip")
      expect(page).to have_content("Start Date: 2022-06-05")
      expect(page).to have_content("End Date: 2022-06-06")
      expect(page).to have_content("Description: trip I guess")
    end
    # within "#trip-3" do
    #   expect(page).to have_content("Name: third trip")
    #   expect(page).to have_content("Start Date: 2022-06-08")
    #   expect(page).to have_content("End Date: 2022-06-09")
    #   expect(page).to have_content("Description: baby's third trip")
    # end
  end

  # it "has links to trips show pages", :vcr do
  #   within "#trip-2" do
  #     click_on("View Trip")
  #   end
  #   expect(current_path).to eq("/trips/2")
  #
  #   expect(page).to have_content("Trip Show Page")
  #   expect(page).not_to have_content("any other Page")
  # end
end
