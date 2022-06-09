require "rails_helper"

RSpec.describe "Item edit page" do
  before do
    @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    @item = JSON.parse(File.read('spec/fixtures/item.json'), symbolize_names: true)
    @items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    @updated_item = JSON.parse(File.read('spec/fixtures/updated_item.json'), symbolize_names: true)
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
      allow(ItemService).to receive(:update).and_return(@updated_item)
      allow(TripService).to receive(:trips_by_user_id).and_return(@trips)
      visit root_path
      click_link 'Login'
      visit "/users/1/items/2/edit"
    end

    it "has a form to edit an item" do
      expect(find('form')).to have_content('Item Name')
      expect(find('form')).to have_content('Description')
      expect(find('form')).to have_content('Count')
      expect(find('form')).to have_content('Tents')
      expect(find('form')).to have_content('Sleeping Bag')
      expect(find('form')).to have_content('Stoves, Grills & Fuel')

      expect(find('form')).to have_button('Update Item')
    end

    it "updates the item when form is filled out" do
      allow(ItemService).to receive(:find_item).and_return(@updated_item)

      fill_in 'Description', with: "My Favorite Harness"
      click_button "Update Item"

      expect(current_path).to eq("/users/1/items/2")
      expect(page).to have_content("Description: My Favorite Harness")
      expect(page).to have_content("Category: Harnesses")
    end
  end

  describe 'when not logged in' do
    before do
      allow(UserService).to receive(:user).and_return(@user)
      allow(ItemService).to receive(:find_item).and_return(@item)
      visit "/users/1/items/2/edit"
    end

    it "does not show the form when visiting a different users edit page" do
      expect(page).not_to have_css("form")

      expect(page).to have_content("How did you get here...")
    end
  end
end
