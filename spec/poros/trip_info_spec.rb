require "rails_helper"

RSpec.describe "trip info poro" do
  it "exists and has attributes" do
    data = {
      trip: {
        id: 1,
        name: "El Cap Trip",
        start_date: "2022-10-10",
        end_date: "2022-10-20",
        host: "Tommy",
        description: "gonna climb ole El Cap",
        lat: 119.6377,
        long: 37.7339,
        area: "El Capitan",
        state: "California",
        users: {id: 2, first_name: "John", last_name: "Muir", email: "muir@gmail.com"},
        items: {id: 4, name: "cliff tent", description: "tent for cliffs", count: 1, category: "tents", owner: "John"},
        weather: {forcast: {date: "2022-10-10", weather: {low_temp: 30.22,
                                                          high_temp: 70.43,
                                                          cloud_coverage: 41,
                                                          feels_like: 72.64,
                                                          humidity: 22,
                                                          percipitation_probability: 0.48,
                                                          visibility: 9800,
                                                          weather: "rain",
                                                          weather_description: "light rain",
                                                          weather_icon: "10d",
                                                          wind_direction: 254,
                                                          wind_gust: 4.23,
                                                          wind_speed: 3.83}}},
        today_sunrise: "10/10/22 at 11:38:03 UTC",
        today_sunset: "10/10/22 at 02:50:03 UTC"

      }
    }
    trip_info = TripInfo.new(data)

    expect(trip_info).to be_a(TripInfo)
    expect(trip_info.id).to eq(data[:trip][:id])
    expect(trip_info.name).to eq(data[:trip][:name])
    expect(trip_info.start_date).to eq(data[:trip][:start_date])
    expect(trip_info.end_date).to eq(data[:trip][:end_date])
    expect(trip_info.host).to eq(data[:trip][:host])
    expect(trip_info.description).to eq(data[:trip][:description])
    expect(trip_info.lat).to eq(data[:trip][:lat])
    expect(trip_info.long).to eq(data[:trip][:long])
    expect(trip_info.area).to eq(data[:trip][:area])
    expect(trip_info.state).to eq(data[:trip][:state])
    expect(trip_info.users).to be_a(Hash)
    expect(trip_info.items).to be_a(Hash)
    expect(trip_info.weather).to be_a(Hash)
    # expect(trip_info.today_sunrise).to eq(data[:trip][:today_sunrise])
    expect(trip_info.today_sunset).to eq(data[:trip][:today_sunset])
  end
end
