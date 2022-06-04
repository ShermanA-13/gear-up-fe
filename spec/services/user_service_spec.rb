require 'rails_helper'

RSpec.describe 'user service' do
  it 'creates a user and returns a new user' do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }
    response = UserService.create_user(data)

    expect(response).to be_a Hash
    expect(response[:data]).to be_a Hash
    expect(response[:data]).to have_key :id
    expect(response[:data][:attributes]).to have_key :first_name
    expect(response[:data][:attributes]).to have_key :last_name
    expect(response[:data][:attributes]).to have_key :email
  end
end
