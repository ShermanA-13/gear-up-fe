require 'rails_helper'

RSpec.describe 'trip info poro' do
  it 'exists and has attributes' do
    # @trip_info = JSON.parse(File.read('spec/fixtures/trip_info.json'), symbolize_names: true)

    data = JSON.parse(File.read('spec/fixtures/trip_info.json'), symbolize_names: true)
    trip_info = TripInfo.new(data)

    expect(trip_info).to be_a(TripInfo)
    expect(trip_info.id).to eq(1)
    expect(trip_info.name).to eq('another first trip')
    expect(trip_info.start_date).to eq('2022-06-08')
    expect(trip_info.end_date).to eq('2022-06-09')
    expect(trip_info.host).to eq('Bonny')
    expect(trip_info.description).to eq("baby's first trip")
    expect(trip_info.lat).to eq('42.73982')
    expect(trip_info.long).to eq('-108.84939')
    expect(trip_info.area).to eq('2. Fairfield Central')
    expect(trip_info.state).to eq('Wyoming')
    expect(trip_info.users).to be_a(Array)
    expect(trip_info.items).to be_a(Array)
    expect(trip_info.comments).to be_a(Array)
    expect(trip_info.weather).to be_a(Array)
  end
end
