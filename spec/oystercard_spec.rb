require 'oystercard'

describe Oystercard do
  it 'Balance method returns 0 when initialized' do
    expect(subject.balance).to eq 0
  end

  it 'top up method sets new balance to 20' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end

  it 'increase balance (using change rspec syntax)' do
    expect {subject.top_up 20}.to change{subject.balance}.by 20
  end

  it 'limit instance variable returns 90' do
    expect(Oystercard::LIMIT).to eq 90
  end
end
