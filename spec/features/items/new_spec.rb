require "rails_helper"

RSpec.describe "Item new page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
    @user_not_found = JSON.parse(File.read('spec/fixtures/user_not_found.json'), symbolize_names: true)
  end

  describe "when logged in" do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow(UserService).to receive(:create_user).and_return(@user)
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:items).and_return(@items)
      allow(ItemService).to receive(:create).and_return(@item)
      allow(ItemService).to receive(:find_item).and_return(@item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit root_path
      find('#login').click
      visit "/users/1/items/new"
    end

    it "has a form to create a new item" do
      expect(find('form')).to have_content('Item Name')
      expect(find('form')).to have_content('Description')
      expect(find('form')).to have_content('Count')
      expect(find('form')).to have_content('Tents')
      expect(find('form')).to have_content('Sleeping Bag')
      expect(find('form')).to have_content('Stoves, Grills & Fuel')
      expect(find('form')).to have_button('Add Item')
    end

    it "creates a new item and redirects to item show page" do
      fill_in 'Item Name', with: "Harness"
      fill_in 'Description', with: "Petzl Adjama"
      fill_in 'Count', with: "1"
      choose option: '6'
      click_button 'Add Item'

      expect(page).to have_content("Harness")
      expect(page).to have_content("Description: Petzl Adjama")
      expect(page).to have_content("Count: 1")
      expect(page).to have_content("Category - Harnesses")
    end
  end

  describe 'when not logged in' do
    before do
      allow(UserService).to receive(:user).and_return(@user)
      visit "/users/1/items/new"
    end

    it "displays no form when user visits page" do
      expect(page).not_to have_css("form")
      expect(page).to have_content("How did you get here...")
    end
  end

  describe "error handling" do
    before do
      allow(UserService).to receive(:user).and_return(@user_not_found)
    end

    it "fails gracefully if user ID does not exist" do
      visit "/users/0/items/new"
      expect(page).to have_content("No user with id 0")
      expect(page).to have_content("Status: NOT FOUND")
      expect(page).to have_content("Code: 404")
    end
  end
end
