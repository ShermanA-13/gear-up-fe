require 'rails_helper'

RSpec.describe 'Users show page' do
  before :each do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }

    @user = UserFacade.create_user(data)
    visit "/login?user_id=#{@user.id}"
  end

  it 'displays user name' do
    expect(page).to have_content('Pickles')
  end
end
