require "rails_helper"

describe "Weather PORO" do
  before do
    weather_attr = {
    id: 2107,
    type: "weather info",
    name: "Little Yosemite Valley",
    weather: {
      forecast: [
        {
          date: "2022-06-09",
          weather: {
              low_temp: 69.28,
              high_temp: 74.88,
              cloud_coverage: 95,
              feels_like: 67.32,
              humidity: 30,
              precipitation_probability: 0,
              visibility: 10000,
              weather: "Clouds",
              weather_description: "Overcast Clouds",
              weather_icon: "04d",
              wind_direction: 256,
              wind_gust: 7.47,
              wind_speed: 6.76
            }
          },
          {
            date: "2022-06-10",
            weather: {
              low_temp: 57.94,
              high_temp: 81.45,
              cloud_coverage: 95,
              feels_like: 55.98,
              humidity: 54,
              precipitation_probability: 0,
              visibility: 10000,
              weather: "Clouds",
              weather_description: "Overcast Clouds",
              weather_icon: "04n",
              wind_direction: 84,
              wind_gust: 3.29,
              wind_speed: 3.8
            }
          }
        ]
      }
    }

    @weather = weather_attr[:weather][:forecast].map do |forecast|
      Weather.new(forecast)
    end
  end

  it "exists and has attributes" do
    expect(@weather).to be_an(Array)
    expect(@weather[1]).to be_a(Weather)

    expect(@weather[0].date).to eq("2022-06-09")
    expect(@weather[0].low_temp).to eq(69.28)
    expect(@weather[0].high_temp).to eq(74.88)
    expect(@weather[0].cloud_coverage).to eq(95)
  end
end
