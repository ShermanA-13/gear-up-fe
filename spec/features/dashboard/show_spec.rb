require 'rails_helper'

describe 'creates user' do
  before :each do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }

    @user = UserFacade.create_user(data)
    visit "/login?user_id=#{@user.id}"
  end

  it 'displays user name', :vcr do
    expect(page).to have_content('Pickles')
  end

  it 'has a link to the users item shed', :vcr do
    click_link("My Shed")
    expect(current_path).to eq("/users/#{@user.id}/items")
  end
end
