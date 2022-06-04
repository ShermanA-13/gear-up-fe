require "rails_helper"

RSpec.describe "user poro" do
  it "exists with attributes" do
    data = {id: "1",
            type: "user",
            attributes: {
              first_name: "User 1",
              last_name: "Test",
              email: "email@gmail.com"
              }
            }

    user = User.new(data)

    expect(user).to be_a(User)
    expect(user.id).to eq("1")
    expect(user.email).to eq("email@gmail.com")
    expect(user.first_name).to eq("User 1")
    expect(user.last_name).to eq("Test")
  end
end
