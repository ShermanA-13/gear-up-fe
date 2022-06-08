require "rails_helper"

describe "Error PORO" do
  before do
    data = {:errors=>[{:status=>"NOT FOUND", :message=>"No user with id 0", :code=>404}]}
    @error = Error.new(data)
  end

  it "exits and has attributes" do
    expect(@error).to be_an(Error)
    expect(@error.status).to eq("NOT FOUND")
    expect(@error.message).to eq("No user with id 0")
    expect(@error.code).to eq(404)
  end
end
