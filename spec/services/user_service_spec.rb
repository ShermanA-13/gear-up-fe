require 'rails_helper'

RSpec.describe 'user service' do
  before :each do
    @data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }
  end
  it 'creates a user and returns a new user', :vcr do
    response = UserService.create_user(@data)

    expect(response).to be_a Hash
    expect(response[:data]).to be_a Hash
    expect(response[:data]).to have_key :id
    expect(response[:data][:attributes]).to have_key :first_name
    expect(response[:data][:attributes]).to have_key :last_name
    expect(response[:data][:attributes]).to have_key :email
  end

  it 'returns users by id', :vcr do
    created_user = UserService.create_user(@data)

    response = UserService.user(created_user[:data][:id])
    expect(response).to be_a Hash
    expect(response[:data]).to be_a Hash
    expect(response[:data]).to have_key :id
    expect(response[:data][:attributes][:first_name]).to eq('Pickles')
    expect(response[:data][:attributes][:last_name]).to eq('McTickles')
    expect(response[:data][:attributes][:email]).to eq('dilllord@dills.org')
  end
end
