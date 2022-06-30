require 'rails_helper'

RSpec.describe 'user service' do
  before do
    @data = {
      first_name: 'Don',
      last_name: 'Rickles',
      email: 'ricklord@ricks.org',
      user_photo: 'https://fakepic.com'
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
    expect(response[:data][:attributes]).to have_key :user_photo
  end

  it 'returns users by id', :vcr do
    created_user = UserService.create_user(@data)

    response = UserService.user(created_user[:data][:id])
    expect(response).to be_a Hash
    expect(response[:data]).to be_a Hash
    expect(response[:data]).to have_key :id
    expect(response[:data][:attributes][:first_name]).to eq('Don')
    expect(response[:data][:attributes][:last_name]).to eq('Rickles')
    expect(response[:data][:attributes][:email]).to eq('ricklord@ricks.org')
    expect(response[:data][:attributes][:user_photo]).to eq('https://fakepic.com')
  end
end
