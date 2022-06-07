require "rails_helper"

RSpec.describe "user poro" do
  it "exists with attributes" do
    data = {id: "1",
            type: "user",
            attributes: {first_name: "Gandalf", last_name: "DaGrey", email: "email@gmail.com"}}

    user = User.new(data)

    expect(user).to be_a(User)
    expect(user.id).to eq("1")
    expect(user.first_name).to eq("Gandalf")
    expect(user.last_name).to eq("DaGrey")
    expect(user.email).to eq("email@gmail.com")
  end
end
