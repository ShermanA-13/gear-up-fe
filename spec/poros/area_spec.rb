require "rails_helper"

describe "area PORO" do
  before do
    area_1_attr = {id: 1, type: "area", attributes: {name: "Area 51", state: "Nevada", url: "thisisaurl.com", lat: "123.6564", long: "37.42562"}}
    @area_1 = Area.new(area_1_attr)
  end

  it "exists and has attributes" do
    expect(@area_1).to be_an(Area)
    expect(@area_1.id).to eq(1)
    expect(@area_1.name).to eq("Area 51")
    expect(@area_1.state).to eq("Nevada")
    expect(@area_1.url).to eq("thisisaurl.com")
    expect(@area_1.lat).to eq("123.6564")
    expect(@area_1.long).to eq("37.42562")
  end
end
