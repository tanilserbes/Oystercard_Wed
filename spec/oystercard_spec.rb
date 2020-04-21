require 'oystercard'

describe Oystercard do
  it 'Balance method returns 0 when initialized' do
    expect(subject.balance).to eq 0
  end

  it 'top up method sets new balance to 20' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end
end
