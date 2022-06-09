require "rails_helper"

RSpec.describe "Item index page" do
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
      allow(ItemService).to receive(:create).and_return(@item)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(GearUpService).to receive(:user_trips).and_return(@trips)
      visit root_path
      click_link 'Login'
      visit "/users/3/items"
    end

    it "displays all of the users items" do
      within "#item-1" do
        expect(page).to have_content("Tent 1")
        expect(page).to have_content("Count: 1")
        expect(page).to have_content("Item ID: 1")
      end
      within "#item-2" do
        expect(page).to have_content("Organic Crash Pad")
        expect(page).to have_content("Count: 5")
        expect(page).to have_content("Item ID: 2")
      end
    end

    it "each item links to the item's show page" do
      within "#item-1" do
        click_link("View Item")
      end

      expect(current_path).to eq("/users/3/items/1")
      expect(page).to have_content("Name: Harness")
      expect(page).to have_content("Count: 1")
    end

    it "has a button to create a new item" do
      click_button("Add an item to your Shed")
      expect(current_path).to eq("/users/1/items/new")
    end
  end

  describe 'when not logged in' do
    before do
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:find_item).and_return(@item)
      visit "/users/1/items"
    end

    it "does not show the button when visiting a different users page" do
      visit "/users/2/items"
      expect(page).not_to have_button("Add an item to your Shed")
    end
  end
end
