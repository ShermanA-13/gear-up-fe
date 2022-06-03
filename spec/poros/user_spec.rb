require "rails_helper"

RSpec.describe "user poro" do
  it "exists with attributes" do
    data = {id: "1",
        type: "user",
        attributes: {
          email: "email@gmail.com",
          first_name: "Fox",
          last_name: "McCloud"
        }
      }

    user = User.new(data)

    expect(user).to be_a(User)
    expect(user.id).to eq("1")
    expect(user.email).to eq("email@gmail.com")
    expect(user.first_name).to eq("Fox")
    expect(user.last_name).to eq("McCloud")
  end
end
