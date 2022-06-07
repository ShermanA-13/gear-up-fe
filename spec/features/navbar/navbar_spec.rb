require 'rails_helper'

RSpec.describe 'navbar' do
  before do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }

    @user = UserFacade.create_user(data)
    visit "/login?user_id=#{@user.id}"
  end

  it 'logo links to user dashboard', :vcr do
    visit "/users/#{@user.id}/items"

    find('.navbar-brand').click
    expect(current_path).to eq('/dashboard')
  end

  it 'links to user shed', :vcr do
    within('.navbar-nav') do
      click_on 'MyShed'
    end
    expect(current_path).to eq("/users/#{@user.id}/items")
  end

  it 'links to user trips page', :vcr do
    within('.navbar-nav') do
      click_on 'MyTrips'
    end
    expect(current_path).to eq("/users/#{@user.id}/trips")
  end
end
