require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new}
  it 'Balance method returns 0 when initialized' do
    expect(oystercard.balance).to eq 0
  end

  describe ' #top_up' do

    it 'raises error if new balance exceeds limit' do
      subject.top_up(Oystercard::LIMIT)
      expect{oystercard.top_up(1)}.to raise_error "You have exceeded the limit of #{Oystercard::LIMIT}"
    end

    it 'top up method sets new balance to 20' do
      subject.top_up(20)
      expect(oystercard.balance).to eq 20
    end

    it 'increase balance (using change rspec syntax)' do
      expect {oystercard.top_up 20}.to change{subject.balance}.by 20
    end
  end

  describe ' #deduct' do

    it { is_expected.to respond_to(:deduct).with(1).argument }
    it 'decrease balance' do
      oystercard.top_up(15)
      expect {oystercard.deduct 5 }.to change{oystercard.balance}.by -5
    end
  end



end
