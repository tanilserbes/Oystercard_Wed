require 'oystercard'

describe Oystercard do
  it 'Balance method returns 0 when initialized' do
    expect(subject.balance).to eq 0
  end
end
