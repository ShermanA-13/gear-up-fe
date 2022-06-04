require 'rails_helper'

RSpec.describe 'user facade' do
  before :each do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }
    @created_user = UserFacade.create_user(data)
  end

  it 'creates and returns user info', :vcr do
    expect(@created_user).to be_a User
  end

  it 'returns user data by user id', :vcr do
    user = UserFacade.user(@created_user.id)
    expect(user.first_name).to eq('Pickles')
    expect(user.last_name).to eq('McTickles')
    expect(user.email).to eq('dilllord@dills.org')
  end
end
