require "rails_helper"

RSpec.describe "Item show page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
  end

  describe "when logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit root_path
      click_link 'Login'
      visit "/users/1/items/1"
    end

    it "displays the item's attributes (name, desc, categ)" do
      expect(page).to have_content("Name: Harness")
      expect(page).to have_content("Count: 1")
      expect(page).to have_content("Item Category: Harnesses")

      expect(page).not_to have_content("Name: Organic Crash Pad")
    end

    it "has a link to return to the user's item index" do
      click_link("Return to the Item Shed")
      expect(current_path).to eq("/users/1/items")
    end

    it "has a link to delete an item" do
      visit "/users/1/items"
      within '#item-1' do
        click_link 'View Item'
      end

      expect(page).to have_link("Delete Harness")
    end

    it "has a button taking you to the update page" do
      click_button "Edit Harness"
      expect(current_path).to eq("/users/1/items/3/edit")
    end
  end

  describe 'when not logged in' do
    before do
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:find_item).and_return(@item)
      visit "/users/1/items/1"
    end

    it "does not have delete link on other users item pages" do
      expect(page).to have_content('Harness')
      expect(page).not_to have_link("Delete Harness")
    end
  end
end
