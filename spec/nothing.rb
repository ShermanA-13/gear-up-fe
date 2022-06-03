require "rails_helper"

describe "test test" do
  it "can tell a string is a string" do
    str = "test"
binding.pry
    expect(str).to be_a(String)
  end
end
