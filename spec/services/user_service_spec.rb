require 'rails_helper'

RSpec.describe 'user service' do
  it 'creates a user and gets a single user' do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }
    UserService.create_user(data)
    search = UserService.get_user(data[:email])

    expect(search).to be_a Hash
    expect(search[:data]).to be_a Hash
    expect(search[:data]).to have_key :id
    expect(search[:data][:attributes]).to have_key :first_name
    expect(search[:data][:attributes]).to have_key :last_name
    expect(search[:data][:attributes]).to have_key :email
  end
end
