require 'rails_helper'

RSpec.describe 'add trip items page' do
  before do
    visit "/login?user_id=1"
  end
  it 'allows you to add your items to a trip' do
    visit "/trips/1/items"

    expect(page).to have_content("What are you bringing?")
  
    within "#check-box-50" do
      page.check("items[]")
    end
    within "#check-box-51" do
      page.check("items[]")
    end

    click_on "Bring These!"
    visit "/trips/1/items"
  end
end
