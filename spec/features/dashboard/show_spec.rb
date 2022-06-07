require 'rails_helper'

describe 'creates user' do
  before :each do
    data = {
      first_name: 'Bonny',
      last_name: 'Jowman',
      email: 'ivebeentrapped@inthecomputer.org',
      user_photo: 'https://lh3.googleusercontent.com/a-/AOh14GjhYI5RIF0qkDbiUtgXjH59K7hoEZ1QpLykFsEh2g=s96-c'
    }

    @user = UserFacade.create_user(data)
    visit "/login?user_id=#{@user.id}"
  end

  it 'displays user name', :vcr do
    expect(page).to have_content('Bonny')
  end

  it 'has a link to the users item shed', :vcr do
    click_link("MyShed")
    expect(current_path).to eq("/users/#{@user.id}/items")
  end
end
