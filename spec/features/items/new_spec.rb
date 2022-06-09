require "rails_helper"

RSpec.describe "Item new page" do
  before do
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
    items = JSON.parse(File.read('spec/fixtures/items.json'), symbolize_names: true)
    trips = JSON.parse(File.read('spec/fixtures/trips.json'), symbolize_names: true)
    allow(UserService).to receive(:create_user).and_return(user)
    allow(UserService).to receive(:user).and_return(user)
    allow(ItemService).to receive(:items).and_return(items)
    allow(GearUpService).to receive(:user_trips).and_return(trips)
    visit root_path
    click_link 'Login'
  end

  it "has a form to create a new item" do
    visit "/users/3/items/new"

    expect(find('form')).to have_content('Item Name')
    expect(find('form')).to have_content('Description')
    expect(find('form')).to have_content('Count')
    expect(find('form')).to have_content('Tents')
    expect(find('form')).to have_content('Sleeping Bag')
    expect(find('form')).to have_content('Stoves, Grills & Fuel')
    expect(find('form')).to have_button('Add Item')
  end

  it "displays no form when user visits page" do
    visit "/users/2/items/new"
    expect(page).not_to have_css("form")
    expect(page).to have_content("How did you get here...")
  end

  it "creates a new item and redirects to item show page" do
    fill_in 'Item Name', with: "Tent 1"
    fill_in 'Description', with: "1 person Tent"
    fill_in 'Count', with: "1"
    choose option: '0'
    click_button 'Add Item'

    expect(page).to have_content("Name: Tent 1")
    expect(page).to have_content("Description: 1 person Tent")
    expect(page).to have_content("Count: 1")
    expect(page).to have_content("Item Category: Tents")
  end
end
