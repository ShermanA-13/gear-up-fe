require 'rails_helper'

RSpec.describe 'user facade' do
  it 'creates and returns user info' do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }

    user = UserFacade.create_user(data)
    expect(user).to be_a User
  end
end
