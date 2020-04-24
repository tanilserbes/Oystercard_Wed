require 'station'

describe Station do
subject(:station) { described_class.new("Earl's Court", 2) }
it {is_expected.to respond_to(:name)}
it {is_expected.to respond_to(:zone)}

  it 'takes initialize values' do
    expect(station.name).to eq "Earl's Court"
    expect(station.zone).to eq 2
  end

end
