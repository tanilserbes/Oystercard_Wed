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

  describe ':top_up' do
    it 'raises error if new balance exceeds limit' do
      subject.top_up(Oystercard::LIMIT)
      expect{subject.top_up(1)}.to raise_error "You have exceeded the limit of #{Oystercard::LIMIT}"
    end
  end
end
