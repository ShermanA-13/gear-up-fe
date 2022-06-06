require "rails_helper"

describe "Area search (index) page" do
  before do
    visit "/areas/search"
  end

  it "has a search bar" do
    expect(find('form')).to have_text_field('Search')
  end
end
