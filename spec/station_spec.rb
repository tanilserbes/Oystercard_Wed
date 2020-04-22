require "station"

describe Station do
  station = Station.new("Angel", 1)

  it "stores a name" do
    expect(station.name).to eq "Angel"
  end

  it "stores the zone it's in" do
    expect(station.zone).to eq 1
  end
  
end
