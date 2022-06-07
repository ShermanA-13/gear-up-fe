require 'rails_helper'

RSpec.describe 'navbar' do
  before do
    data = {
      first_name: 'Pickles',
      last_name: 'McTickles',
      email: 'dilllord@dills.org'
    }

    @user = UserFacade.create_user(data)
    visit "/login?user_id=#{@user.id}"
  end

  it 'logo links to user dashboard', :vcr do
    visit "/users/#{@user.id}/items"
    find('.navbar-brand').click
    expect(current_path).to eq('/dashboard')
  end
end
