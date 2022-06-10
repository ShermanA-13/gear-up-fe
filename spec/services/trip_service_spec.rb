require "rails_helper"
RSpec.describe TripService do
  describe "class methods" do
    before do
      data = {
        id: 3,
        attributes: {
          name: "Adventure Time",
          description: "Quite the adventure",
          start_date: "2023-06-08",
          end_date: "2023-06-09"
        }
      }
      trip1 = Trip.new(data)
      expect(trip1).to be_a(Trip)
    end
    it ".get_trip_by_id", :vcr do
      trip_data = TripService.get_trip_by_id(1)

      expect(trip_data).to be_a(Hash)
      expect(trip_data).to have_key(:data)
    end

    it "gets trips by user_id", :vcr do
      user_trips = TripService.trips_by_user_id(1)
      expect(user_trips).to be_a(Hash)
    end
  end
end
