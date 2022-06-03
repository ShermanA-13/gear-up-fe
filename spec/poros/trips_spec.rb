require "rails_helper"

RSpec.describe "trips poro" do
  let!(:attributes_user) { {id: 1, type: "user", attributes: {name: "Bob", email: "email@gmail.com"}} }
  let!(:user) { User.new(attributes_user) }
  let!(:attributes) { {id: 1, type: "trip", attributes: {name: "Steve's Crag", location: "some location", host_id: user.id}} }
  let!(:trip) { Trip.new(attributes) }

  it "exists" do
    expect(trip).to be_a(Trip)
  end

  it "has attributes" do
    expect(trip.name).to eq("Steve's Crag")
    expect(trip.location).to eq("some location")
    # expect(trip.start_date).to eq()
    # expect(trip.end_date).to eq()
    expect(trip.id).to eq(1)
    expect(trip.host_id).to eq(1)
  end
end
