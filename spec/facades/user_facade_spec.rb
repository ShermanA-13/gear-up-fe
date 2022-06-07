require 'rails_helper'

RSpec.describe 'user facade' do
  before :each do
    data = {
      first_name: 'Don',
      last_name: 'Rickles',
      email: 'ricklord@ricks.org',
      user_photo: 'https://fakepic.com'
    }
    @created_user = UserFacade.create_user(data)
  end

  it 'creates and returns user info', :vcr do
    expect(@created_user).to be_a User
  end

  it 'returns user data by user id', :vcr do
    user = UserFacade.user(@created_user.id)
    expect(user.first_name).to eq('Don')
    expect(user.last_name).to eq('Rickles')
    expect(user.email).to eq('ricklord@ricks.org')
    expect(user.user_photo).to eq('https://fakepic.com')
  end
end
